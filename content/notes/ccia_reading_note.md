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
### 1.1 What is concurrency
- In computer system, concurrency is about two or more indenpendent activites happening at the same time.
- Sometimes, people also referring task switching is concurrency, but it's an illusion of concurrency. In a single-core scenario, the operating system do some scheduling to divide the different tasks into chunks, and then the chunks from different tasks are interleaved.
- The number of hardware threads is an important factor to consider. It describes how many independent tasks the hardware can run concurrently.
#### Approaches to concurrency


