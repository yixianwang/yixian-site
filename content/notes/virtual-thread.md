+++
title = 'Virtual Thread'
date = 2025-06-05T21:10:40-04:00
+++

## Platform threads
Platform threads are the traditional threads provided by the operating system. They are managed by the OS and can be used to perform concurrent tasks. However, they can be resource-intensive and may lead to issues like thread contention and deadlocks.

## Virtual threads
Virtual threads are a lightweight alternative to platform threads, introduced in Java 19 as a preview feature and made stable in Java 21. They are designed to be more efficient and easier to use for concurrent programming. Virtual threads are managed by the Java Virtual Machine (JVM) rather than the operating system, allowing for a large number of concurrent tasks without the overhead associated with platform threads.
Virtual threads are created using the `Thread.ofVirtual()` method, and they can be used in the same way as platform threads. However, they are more efficient because they do not require a separate OS thread for each task. Instead, they use a small amount of memory and can be scheduled by the JVM to run on available platform threads.

## Platform thread vs Virtual thread
```java
// platform thread
Thread.ofPlatform().start(() -> {
  System.out.println(Thread.curentThread()); // Thread[#21,Thread-0,5,main]
});

// virtual thread
Thread vt = Thread.ofVirtual().start(() -> {
  System.out.println(Thread.currentThread()); // VirtualThread[#22]/runnable@ForkJoinPool-1-worker-1
});

// wait for the virtual thread to finish
vt.join();
```

## Virtual thread Example
```java
Set<String> threadNames = ConcurrentHashMap.newKeySet();

// Create virtual threads with executors
ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor();
IntStream.range(0, 1_000_000).forEach(i -> {
  executor.submit(() -> {
    Thread.sleep(Duration.ofSeconds(1));
    String threadInfo = Thread.currentThread().toString(); // VirtualThread[#22]/runnable@ForkJoinPool-1-worker-1
    String workerName = threadInfo.split("@")[1]
    threadNames.add(workerName);
    return i;
  });
});

System.out.println("Platform Threads: " + threadNames.size());
```

## Best Practices
1. Avoid Thread Pools
Use `Executors.newVirtualThreadPerTaskExecutor()` instead of traditional pools.
```java
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    executor.submit(() -> processTask(task));
}
```

2. Never Pool Virtual Threads
They’re designed to be ephemeral. Creating millions is safe.

3. Replace Async Callbacks
Favor synchronous code over CompletableFuture or reactive patterns:
```java
// INSTEAD OF:
CompletableFuture.supplyAsync(() -> fetchData(), pool);

// USE:
Thread.startVirtualThread(() -> fetchData());
```

4. Minimize synchronized Blocks
Synchronized blocks pin virtual threads to carrier threads, reducing throughput. Prefer ReentrantLock:
```java
private final ReentrantLock lock = new ReentrantLock();

void safeMethod() {
    lock.lock();  // Allows thread unmounting
    try { /* ... */ } 
    finally { lock.unlock(); }
}
```

5. Limit `ThreadLocal` Usage
Millions of virtual threads = millions of `ThreadLocal` copies. Use `ScopedValue` (Java 21) for shared immutable data:
```java
final ScopedValue<String> USER = ScopedValue.newInstance();
ScopedValue.where(USER, "alice", () -> processRequest());
```

6. Avoid `Object.finalize()`
Finalizers hold thread references, delaying garbage collection.

7. Use NIO/Asynchronous Libraries
Ensure I/O libraries (JDBC, HTTP, etc.) support non-blocking operations. Wrap blocking I/O in virtual threads.

8. Structured Concurrency (Preview)
Group related tasks with StructuredTaskScope (Java 21):
```java
try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
    Future<String> user = scope.fork(() -> fetchUser());
    Future<Integer> order = scope.fork(() -> fetchOrders());
    scope.join();
    return new Response(user.resultNow(), order.resultNow());
}
```

9. Monitor with JDK Flight Recorder
Use JFR events (jdk.VirtualThreadStart, jdk.VirtualThreadEnd) for profiling.

10. Handle Blocking Operations Carefully
Offload CPU-bound tasks to a separate pool of platform threads:
```java
ExecutorService cpuBoundExecutor = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());
```

### When to Use Virtual Threads
- I/O-Bound Workloads: HTTP servers, database calls, message queues.
- High-Concurrency Apps: Each request can run in its own thread.
- Simplified Code: Replace complex async code with synchronous logic.

### When to Avoid
- CPU-Intensive Tasks: Use platform threads instead.
- Native Code/JNI: Operations blocking in native code.

## Conclusion
- `StructuredTaskScope`:	✅✅✅ 最结构化、最安全
- `Executors.newVirtualThreadPerTaskExecutor()`:	✅✅ 适合大多数任务提交场景
- `Thread.ofVirtual().start()`:	✅ 用于简单任务，不建议用于批量任务
- 自定义虚拟线程工厂 + Executors:	✅ 灵活定制，适合需要控制线程属性的场景

> ✅ 最佳实践建议：尽量使用 **结构化并发**（如 `StructuredTaskScope`）或通过 `Executors.newVirtualThreadPerTaskExecutor()` 管理虚拟线程，避免零散使用裸线程。

## StructuredTaskScope
### 场景 1：并行调用多个服务，只要最快返回的结果
比如我们有多个外部服务，结果一致，我们只需要最快响应的那一个。 使用 `StructuredTaskScope.ShutdownOnSuccess`：
 
```java
import java.util.concurrent.StructuredTaskScope;

String result;

try (var scope = new StructuredTaskScope.ShutdownOnSuccess<String>()) {
    scope.fork(() -> callServiceA());
    scope.fork(() -> callServiceB());
    scope.fork(() -> callServiceC());

    scope.join();  // 等待其中一个成功
    result = scope.result();  // 获取第一个成功的结果
}
System.out.println("First successful result: " + result);
```

#### ✅ 特点：
- 只保留第一个成功的任务。
- 其他线程自动中断（通过虚拟线程的挂起机制，几乎无成本）。


### 场景 2：多个任务并发执行，但任何一个失败就全部取消
比如我们在并行执行数据库写入、日志记录、缓存刷新，只要任何一个失败就放弃整个操作。 使用 `StructuredTaskScope.ShutdownOnFailure`：
```java
import java.util.concurrent.StructuredTaskScope;

try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
    scope.fork(() -> writeToDatabase());
    scope.fork(() -> updateCache());
    scope.fork(() -> writeAuditLog());

    scope.join();               // 等所有完成或失败
    scope.throwIfFailed();      // 任何一个失败都会抛出异常
}
```

#### ✅ 特点：
- 所有任务并发执行。
- 一旦有任务抛出异常，其他任务会被取消。
- 统一处理异常和取消逻辑，不再需要 try-catch 每个任务。

### 场景 3：父任务等待所有子任务完成，然后合并结果
比如我们调用 3 个服务，要组合它们的结果生成最终响应。 使用 `StructuredTaskScope` + `ShutdownOnFailure` + `Future` 变量：
```java
String userInfo, orderInfo, paymentInfo;

try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
    var userFuture = scope.fork(() -> getUser());
    var orderFuture = scope.fork(() -> getOrder());
    var paymentFuture = scope.fork(() -> getPayment());

    scope.join();
    scope.throwIfFailed();

    userInfo = userFuture.resultNow();
    orderInfo = orderFuture.resultNow();
    paymentInfo = paymentFuture.resultNow();

    String response = combine(userInfo, orderInfo, paymentInfo);
    System.out.println("Final response: " + response);
}
```

| 使用情境      | 适合的 Scope 子类                             | 特点                   |
| --------- | ---------------------------------------- | -------------------- |
| 等最快返回结果   | `ShutdownOnSuccess<T>`                   | 类似 "anyOf"           |
| 等全部成功     | `ShutdownOnFailure`                      | 所有成功才继续              |
| 聚合多个任务结果  | `ShutdownOnFailure` + 多个 `Future`        | 效果类似 `Promise.all()` |
| 有条件并发执行   | 任意 `StructuredTaskScope`                 | 动态控制任务加入和取消          |
| 带超时的结构化并发 | 任意 `StructuredTaskScope` + `joinUntil()` | 带 deadline 控制        |

> 如果你在 Java 中有多个并发任务需要一起协调、失败处理、结果聚合，StructuredTaskScope 是最安全、最现代化的解决方案，特别适合配合虚拟线程使用。


## `Executors.newVirtualThreadPerTaskExecutor()`
### 场景 1：高并发 Web 爬虫 / 批处理任务
假设你需要爬取上千个网页，或者处理成千上万个任务，传统线程池（如 FixedThreadPool）会由于线程资源限制而阻塞。但使用虚拟线程可以立即创建大量轻量级线程并执行任务。
```java
import java.net.URI;
import java.net.http.*;
import java.util.concurrent.*;

var urls = List.of("https://a.com", "https://b.com", "https://c.com");  // 假设有上千个

try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    List<Future<String>> futures = urls.stream()
        .map(url -> executor.submit(() -> fetchPage(url)))
        .toList();

    for (Future<String> f : futures) {
        System.out.println(f.get());  // 输出内容或处理
    }
}

String fetchPage(String url) throws Exception {
    var client = HttpClient.newHttpClient();
    var request = HttpRequest.newBuilder(new URI(url)).build();
    return client.send(request, HttpResponse.BodyHandlers.ofString()).body();
}
```

#### ✅ 特点：
- 自动创建虚拟线程，每个任务不受线程池限制
- 使用 try-with-resources 自动关闭执行器，避免资源泄露
- 任务之间完全隔离，不会互相影响

### 场景 2：服务端请求并发处理
每个 HTTP 请求用一个虚拟线程处理，避免了传统线程池的瓶颈：
```java
ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor();

server.onRequest((req) -> {
    executor.submit(() -> handleRequest(req));
});
```
> 适用于微服务、API 网关、数据库连接池等服务端并发处理场景。

### 场景 3：异步任务编排，不关心返回值
比如日志记录、统计打点，不需要返回值，可以直接提交：
```java
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    executor.submit(() -> logUserAction("login", "user123"));
    executor.submit(() -> sendAnalytics("open_homepage"));
}
```

### 场景 4：并行测试执行器
在测试框架中，可以用虚拟线程并行跑多个测试用例，提升测试吞吐量：
```java
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    List<Future<Boolean>> results = testCases.stream()
        .map(test -> executor.submit(() -> runTestCase(test)))
        .toList();

    for (Future<Boolean> r : results) {
        assert r.get();  // 所有测试应通过
    }
}
```