+++
title = '[C++ Concurrency in Action 2nd Edition by Anthony W.] Reading Note'
date = 2023-11-23T17:51:57-05:00
+++

## Chapter 1: Introduction
- **concurrency**
- processor(including processing unit(or core))
- **task switching**
- context switch
- **hardware threads**
### 1.1 Concurrency
- In computer system, **concurrency** is about two or more indenpendent activites happening at the same time.
- Sometimes, people also referring **task switching** is concurrency, but it's an illusion of concurrency. In a single-core scenario, the operating system do some scheduling to divide the different tasks into chunks, and then the chunks from different tasks are interleaved. Task switching also involves **context switching**, it just saves and reloads some CPU state and instruction pointers.
- The number of **hardware threads** is an important factor. It describes how many independent tasks the hardware can run concurrently.
#### approaches to concurrency
1. multiple single-threaded processes: 
    - pass messages to each other through normal interprocess communication channels (signals, sockets, files, pipes, and so on)
        - OS provides many protections between processes to avoid one process accidentally modifying data belonging to another process.
        - Inherent overhead: it takes some time to start a process.  
    - cons: such communication is often **complicated to set up or slow, or both**
    - pros: easier to write **safe** concurrent code
2. multithreaded process(favored):
    - Shared memory: all threads in a process share the same address space, and most of the data can be accessed directly from the all threads. (global variables remain global, pointers or references to objects or data can be passed around among threads)
    - cons: **flexibility** - we must ensure that the view of the data seen by each thread is consistent whenever it's accessed.
    - pros: low **overhead**
#### concurrency vs. parallelism
- separation of concerns and performance

