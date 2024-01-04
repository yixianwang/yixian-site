+++
title = 'Spring Boot'
date = 2023-12-27T09:02:18-05:00
+++

## Spring bean
- an instance of a class managed by the Spring container

### show all default beans
```java
  // within main method
  ApplicationContext apc = SpringApplication.run(ClassName.class)
  for (String s : apc.getBeanDefinitionNames()) {
    System.out.println(s);
  }
```

## Spring container
- **part of the core of the Spring framework**
- **managing all beans**: it decides when to create this instance, when to kill this instance, and how to initialize the instance, etc.
- **performs dependency injection**

## IoC(Inversion of Control)
- instead of the programmer really deciding the flow of the application, deciding what objects are created, etc. 
- this all handed over to the Spring framework(or more precisely to the Spring container)

## Dependency Injection
IoC entails Dependency Injection

- instead of in our code we have to instantiate some new object, Spring container is actually instantiating this object

> Spring container is **injecting** object for us
