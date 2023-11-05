+++
title = 'Draft: Inter-threads Communication'
date = 2023-11-03T02:19:27-04:00
+++

Pthread for inter-threads communication.
<!--more-->
- [Pthreads](https://en.wikipedia.org/wiki/Pthreads)

There are a few ways to communicate between threads in pthread. 
1. One way is to use **shared memory**. 
> Shared memory is a region of memory that is accessible to all threads in a process. To use shared memory, you first need to allocate a region of memory. You can do this using the `malloc()` function. Once you have allocated a region of memory, you can then share it with other threads by using the `shmget()` function.

2. Another way to communicate between threads in pthread is to use **semaphores**. 
> Semaphores are a type of synchronization primitive that allows you to control access to a shared resource. To use semaphores, you first need to create a semaphore. You can do this using the `sem_init()` function. Once you have created a semaphore, you can then use it to control access to a shared resource. For example, you can use a semaphore to ensure that only one thread can access a shared variable at a time.

3. Finally, you can also use **pipes** to communicate between threads in pthread. 
> Pipes are a type of inter-process communication (IPC) mechanism that allows you to send data between processes. To use pipes, you first need to create a pipe. You can do this using the `pipe()` function. Once you have created a pipe, you can then use it to send data between threads. For example, you can use a pipe to send a message from one thread to another.

