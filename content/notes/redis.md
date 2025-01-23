+++
title = 'Redis'
date = 2025-01-22T23:53:20-05:00
+++

## SETNX
- The SETNX command in **Redis** stands for **SET if Not eXists**. It is used to set a key to a value only if the key does not already exist. This operation is atomic, which means it ensures that no race conditions occur when multiple clients attempt to execute the command simultaneously.
- syntax: `SETNX key value`

### Parameters:
**key**: The name of the key to set.
**value**: The value to associate with the key if it does not already exist.

### Behavior:
- If the key **does not exist**, the command sets the key with the given value and returns 1.
- If the key **already exists**, the command does nothing and returns 0.
This is useful for implementing **distributed locks** or ensuring that certain keys are only set once.

### Summary
- SETNX is commonly used to implement a **distributed locking mechanism**. For example:

1. Use SETNX lock_key "lock_value" to acquire a lock.
2. If the command returns 1, the lock is successfully acquired.
3. If the command returns 0, another process holds the lock.

- To ensure the lock is eventually released, this is often paired with a TTL (using EXPIRE or SET with options) to avoid deadlocks.

Let me know if you’d like more examples or related use cases!

## Tools like Redis (Redlock) are used to handle locks in distributed systems.

## Queue-Based Processing
- Implement message queues (e.g., Kafka, RabbitMQ) at the Java level for sequential processing of requests.

## Optimistic Locking
- If your database schema includes a version column, you can handle it in Java:
```java
@Version
private int version;
```
- JPA will automatically check and manage version conflicts during updates.

## Transaction annotation
- Annotate methods with @Transactional to manage database operations atomically.

## 

## Prompt
```
how bank system solve race conditions to avoid duplicate transactions
```

```
how to use 2. Optimistic Locking and 3. Pessimistic Locking in bank system. should they be used in database or java system?
```

```
explain Libraries like Axon Framework can help manage event sourcing and CQRS in Java applications.
```
