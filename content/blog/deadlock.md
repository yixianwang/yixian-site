+++
title = 'Deadlock'
date = 2023-11-03T01:13:37-04:00
+++

Deadlock defination and how to prevent deadlock.
<!--more-->

# Situations of deadlock
- In concurrent computing, deadlock is any situation in which **no member of some group of entities can proceed** because each waits for another member, including itself, to take action, such as sending a message or, more commonly, releasing a lock. 
> Deadlocks are a common problem in multiprocessing systems, parallel computing, and distributed systems, because in these contexts systems often use software or hardware locks to arbitrate shared resources and implement process synchronization.

- In an operating system, a deadlock occurs when **a process or thread enters a waiting state** because a requested system resource is held by another waiting process, which in turn is waiting for another resource held by another waiting process. If a process remains indefinitely unable to change its state because resources requested by it are being used by another process that itself is waiting, then the system is said to be in a deadlock.

- In a communications system, deadlocks occur mainly due to **loss or corruption of signals** rather than contention for resources.

# Avoid Deadlock in Concurrent Programming
Deadlock is a permanent blocking of a set of threads that are competing for a set of resources. Just because some thread can make progress does not mean that there is not a deadlock somewhere else.

## 1. Self deadlock && Recursive Deadlock
The most common error causing deadlock is 
- **Self deadlock**: a thread tries to acquire a lock it is already holding. 
- **Recursive deadlock**: is very easy to program by mistake.

For example, if a code monitor has every module function grabbing the mutex lock for the duration of the call, then any call between the functions within the module protected by the mutex lock immediately deadlocks. If a function calls some code outside the module which, through some circuitous path, calls back into any method protected by the same mutex lock, then it will deadlock too.

### Solution
The solution for this kind of deadlock is to **avoid calling functions outside the module** when you don't know whether they will call back into the module without reestablishing invariants and dropping all module locks before making the call. Of course, after the call completes and the locks are reacquired, the state must be **verified** to be sure the intended operation is still valid.
> Summary: avoid calling functions outside the module and if called, it has to be verified the intended operation is still valid.

## 2. Permanent blocking of threads
An example of another kind of deadlock is when two threads, thread 1 and thread 2, each acquires a mutex lock, A and B, respectively. Suppose that thread 1 tries to acquire mutex lock B and thread 2 tries to acquire mutex lock A. Thread 1 cannot proceed and it is blocked waiting for mutex lock B. Thread 2 cannot proceed and it is blocked waiting for mutex lock A. Nothing can change, so this is a permanent blocking of the threads, and a deadlock.

### Solution1: lock hierarchy
This kind of deadlock is avoided by establishing an order in which locks are acquired (a **lock hierarchy**). When all threads always acquire locks in the specified order, this deadlock is avoided.
> Summary: not optimal. The discarded lock might have many assumptions and need to reevaluate later.

### Solution2: mutex_trylock()
Adhering to a strict order of lock acquisition is not always optimal. When thread 2 has many assumptions about the state of the module while holding mutex lock B, giving up mutex lock B to acquire mutex lock A and then reacquiring mutex lock B in order would cause it to discard its assumptions and reevaluate the state of the module.

The blocking synchronization primitives usually have variants that attempt to get a lock and fail if they cannot, such as `mutex_trylock()`. 
> Summary: optimal. This allows threads to violate the lock hierarchy when there is no contention. When there is contention, the held locks must usually be discarded and the locks reacquired in order.

## 3. Deadlocks Related to Scheduling
Because there is no guaranteed order in which locks are acquired, a problem in threaded programs is that a particular thread never acquires a lock, even though it seems that it should.

This usually happens when the thread that holds the lock releases it, lets a small amount of time pass, and then reacquires it. Because the lock was released, it might seem that the other thread should acquire the lock. But, because nothing blocks the thread holding the lock, it continues to run from the time it releases the lock until it reacquires the lock, and so no other thread is run.

You can usually solve this type of problem by calling `thr_yield(3T)` just before the call to reacquire the lock. This allows other threads to run and to acquire the lock.

Because the time-slice requirements of applications are so variable, the threads library does not impose any. Use calls to `thr_yield()` to make threads share time as you require.

# Locking Guidelines
Here are some simple guidelines for locking.
1. Try **not to hold locks across long operations** like I/O where performance can be adversely affected.
2. **Don't hold locks when calling a function that is outside the module** and that might reenter the module.
3. In general, **start with a coarse-grained approach**, identify bottlenecks, and add finer-grained locking where necessary to alleviate the bottlenecks. Most locks are held for short amounts of time and contention is rare, so fix only those locks that have measured contention.
4. When using multiple locks, avoid deadlocks by making sure that **all threads acquire the locks in the same order**.