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