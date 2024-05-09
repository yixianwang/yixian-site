+++
title = 'A Concepts'
date = 2024-04-30T18:58:08-04:00
+++

```

static block?

singleton vs immutable class

abstract: class, method
final: class, method, variable
static: inner class, method, variable

jvm:
method area(after java 8, meta space): static, class template
heap: objects
vm stack: references and method
native(c/c++) method stack: old api within jam


jconsole
IntelliJ profiler
java flight recorder(since java 11 is free)
spring actuator

ArrayList<? extends Staff>  list = new ArrayList();

confluence page->
	service 00 
				-> 000

bytestream(8 bits), characterstream(16 bits)
fileinputstream
fileread

lambda function type name

functional interface with static

virtual thread !!!!!         loom project

persons.stream(); vs persons.parallelStream();

method reference

traditional thread: use thread pool

thread pool vs virtual thread

threadFactory

synchronized method
synchronized static method

callable futureTask.get block the thread vs completableFuture

volatile : 2:38 visibility only not thread safety

CAS 

is that necessary to set accessible back to false for those private members


//////////////////
osi model, 7 layers vs tcp/ip model
200 1 2 4
307 8
400 1 3 4
500 

session/ cookies
	sticky session, weighted/ round robin

/// day 2
- Bean scope
  - singleton(default)
  - prototype
  - request
  - session
  - application
  - websocket

- types of DI(pros and cons)
  - constructor based DI
  - settrer based DI
  - filed based DI

- Bean Life Cycle
  - 
```

## Java is passed by Value or Reference?
- In Java, there are two kinds of data type, **Primitive** data types and **Non-primitive** data types.
- For primitive types, they are built-in data types in Java including int/short/long/float/double/char/byte/boolean. They are all passed by value.
- For non-primitive types, they are also passed by value, the value here is actually the memory address of the object. e.g. annotation, class, interface, enum, array.
- In conclusion all data types in Java are passed by value.

## static keyword

## Hashmap workflow
- Internally, Hashmap is an array of linkedList. 
- 

## How many access modifiers?
- public: visible in all classes in all packages 
- protected: visible to all classes in the same package or classes in other packages that are a subclass 
- default: visible to all classes in the same package 
- private: visible only in the same class

## Pros and Cons of static

## Diff map and set. Can we have duplicate keys in map

## Given a series data, how to detect duplicate data and skip it?

## Comparable vs Comparator

## How GC works / GC generation
- When Java programs run on the JVM, objects are created on the heap, which is a portion of memory dedicated to the program. Eventually, some objects will no longer be needed. The garbage collector finds these unused objects and deletes them to free up memory.

- A generational garbage collector collects the short-lived objects more frequently than the longer lived ones. Short-lived objects are stored in the first generation, generation 0. The longer-lived objects are pushed into the higher generations, 1 or 2. The garbage collector works more frequently in the lower generations than in the higher ones.

- When an object is first created, it is put into generation 0. When the generation 0 is filled up, the garbage collector is invoked. The objects that survive the garbage collection in the first generation are promoted onto the next higher generation, generation 1. The objects that survive garbage collection in generation 1 are promoted onto the next and the highest generation, generation 2. This algorithm works efficiently for garbage collection of objects, as it is fast.

## Generics in Java, what is it, why we need it?

## Type erasing in Java, about generics

## what/why generic

## How to handle exceptions

## Checked vs Unchecked exception

## Threadpool 的 coding

## Multi-threading concepts and coding

## abstract, final, static
```
abstract: class, method
final: class, method, variable
static: inner class, method, variable, static block
```

### singleton vs immutable class



## JVM
- method area(after java 8, meta space): static, class template
- heap: objects
- vm stack: references and method
- native(c/c++) method stack: old api within jam

## Data Structures
- **Map** is not in **Collection** framework. That's why we cannot directly iterate key-value pairs within any Map implementation.

### Collection vs Collections
- **Collection** framework is for data structures.
- **Collections** is a class. That class contains lots of static methods including reverse/sort. That can help us manipulate our data structures including arrays.

### Comparison between any pair of data structures
![ds1](images-a/1.png)
![ds2](images-a/2.png)

## Java Flight Recorder
- It's a place that we can monitor our Java application. To check if there is any bottleneck for our web application regarding to the hardware and resources.

- java Flight Recorder(since java 11 is free)
- jconsole
- IntelliJ profiler
- Spring Actuator

## Generic Data type
- Why we wanna have it?
  - 

## Design Patterns
### Singleton
- A singleton class means only one object can be created from the class.

## HTTP status codes
```
200 OK -- the request succeeded.
201 Created -- the request succeeded, and a new resource was created as a result.
202 Accepted -- the request has been accepted for processing, but the processing has not been completed.
204 No Content -- the request succeeded, but that the client doesn't need to navigate away from its current page.

307 Temporary Redirect -- the resource requested has been temporarily moved to the URL given by the Location headers.
308 Permanent Redirect -- the resource requested has been definitively moved to the URL given by the Location headers.

400 Bad Request -- the server cannot or will not process the request due to client error.
401 Unauthorized -- the request has not been completed because it lacks valid authentication credentials.
403 Forbidden -- the server understands the request but refuses to authorize it.
404 Not Found -- the server cannot find the requested resource.

500 Internal Server Error -- the server has encountered a situation it does not know how to handle.
```

## Bean Scope
1. Singleton(default). The IoC container creates only one instance of the bean, and reuses it whenever that bean is requested. This is the default cope in Spring.
2. Prototype. The Ioc container creates a new instance of the bean every time it is requested. 
> Only valid in the context of a Spring Web ApplicationContext.
3. Request. A new instance of the bean is created for **each HTTP request**.
4. Session. A new instance of the bean is created for **each HTTP session**.
5. Application. A single instance of the bean is created for the entire web application context. This means all requests and sessions share the same instance of the bean.
6. WebSocket. Similar to session scope, but designed for WebSocket-based interactions.

### Choose Appropriate Scope
- Singleton is suitable for stateless beans or beans that are expensive to create.
- Prototype is useful for stateful beans or beans that need to maintain their state separately.
- Request, Session, and Application scopes are suitable for beans that hold web-related state information and need to be scoped accordingly.

## Inversion of Control
- It is a principle which **transfer the control of the objects** to a container or framework.

## Dependency Injections
1. Constructor Injection: for **mandatory dependencies** so that our bean is ready to use when it is first time called.
  - pros:
    - All required dependencies are available at initialization time.
    - it's the only way for us to create immutable dependencies. It can avoid NullPointerException.
    - it also simplifies unit test.
    - Preventing errors in Tests
  - cons:
2. Setter Injection: only for **optional dependencies** to avoid **circular dependencies**.
  - pros:
  - cons:
3. Filed Injection: 
  - pros:
  - cons: it makes headache to test, so how do you test that without bring up spring context or using some type of reflection utilities to inject that. It can be done but it gives us a big headache when we do a private field in Autowired