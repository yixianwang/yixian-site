+++
title = 'Thread vs Process'
date = 2023-11-03T00:54:29-04:00
+++

The difference between thread and process.
<!--more-->
- A thread is a **lightweight process** that **shares the same address space** as other threads in the same process. 
- A process is a **heavyweight unit** of execution that has its **own address space, memory, and resources**.

- Threads are typically used to **improve the performance** of an application by allowing multiple tasks to be executed concurrently. 
- Processes are typically used to **improve the security** of an application by isolating different tasks from each other.

| Feature       | Thread                                                             | Process                      |
| ------------- | ------------------------------------------------------------------ | ---------------------------- |
| Address Space | Shares the same address space as other threads in the same process | Has its own address space    |
| Memory        | Shares the same memory as other threads in the same process        | Has its own memory           |
| Resources     | Shares the same resources as other threads in the same process     | Has its own resources        |
| Performance   | Typically better than process                                      | Typically worse than threads |
| Security      | Less secure than processes                                         | More secure than threads     |