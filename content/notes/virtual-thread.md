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
