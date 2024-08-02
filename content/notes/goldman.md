+++
title = 'Goldman'
date = 2024-07-29T23:56:52-04:00
+++

3-5 years of strong programming skills in Java with proficiency in object-oriented design principles
Experience with Java frameworks such as DropWizard, Spring, and Hibernate
Familiarity with web development frameworks (Angular or React)
Familiarity with distributed storage systems like DB2, Oracle, Cassandra, MongoDB
Familiarity with continuous integration and continuous deployment (CI/CD) pipelines, especially using Git
Working knowledge of Unix/Linux environments

## OOD principles
- Encapsulation
Example:
"Encapsulation involves bundling the data (attributes) and methods (functions) that operate on the data into a single unit, or class, and restricting access to some of the object's components. In my projects, I've used encapsulation to ensure that an object's internal state cannot be altered directly from outside the class, which helps maintain data integrity."

- Abstraction
Example:
"Abstraction is about hiding the complex implementation details and showing only the necessary features of an object. I utilize abstraction to create simple interfaces for complex systems. For instance, in a payment processing system, I defined abstract classes and interfaces for different payment methods, allowing the system to handle various payment types in a uniform manner."

- Inheritance
Example:
"Inheritance allows a class to inherit properties and behavior from another class. This helps in reusing code and establishing a natural hierarchy between classes. I used inheritance in a project where different types of employees inherited from a base Employee class, allowing common properties like name and ID to be shared while extending specific behaviors for full-time and part-time employees."

- Polymorphism
Example:
"Polymorphism enables objects to be treated as instances of their parent class rather than their actual class. This is particularly useful for implementing dynamic method dispatch. I've implemented polymorphism in scenarios like defining a common interface for different shape classes (Circle, Square, Triangle) and using it to perform operations like area calculation without knowing the specific type of shape at runtime."

- The first answer is focused on explaining object-oriented design principles (OOP) such as encapsulation, abstraction, inheritance, and polymorphism.
   - (encapsulation, abstraction, inheritance, and polymorphism)

- The second answer focuses specifically on SOLID principles, which are a subset of object-oriented design principles aimed at improving software design.
   - (Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion)

## DropWizard
Yes, I have experience with DropWizard.
In my current project, we use both DropWizard and SpringBoot as backend framework.
And I use DropWizard only for performance purpose. For instance some our services requires fast response and they doesn't have any complex business logic, like those realtime update services in our dashboard system. For those microservices we use DropWizard, as it designed for simplicity and performance.
And the only difference between DropWizard and SpringBoot, is that it DropWizard doesn't support dependency injection by default. That's also the main reason it has better performance for the simple services.

That's how we use DropWizard and SpringBoot in our current project.

Yeah, that's my experience with DropWizard.


It uses Jetty, a high-performance HTTP server, and integrates with libraries like Jackson and Jersey for efficient JSON processing and RESTful services.

My current project uses DropWizard for the microservices that require fast response like the those realtime update widget in the system.

## Angular
Yes, I have extensive experience with Angular. Over the past three years, I have worked on several projects using from Angular 8 and Angular 15. In my current role at Shopify, I developed a complex data analytics dashboard using Angular, integrating it with RESTful APIs built with Spring Boot and DropWizard.

I have a solid understanding of core Angular concepts such as components, directives, services, dependency injection, routing, and reactive forms. 

For example, in one of my projects, I implemented lazy loading to optimize the performance of a large application, which resulted in a significant reduction in load time.

Additionally, I am proficient with Angular CLI for project setup and development, and I have used RxJS extensively for handling asynchronous data streams. One particular challenge I faced was managing state in a large application, which I successfully addressed using NgRx for state management.

## Cassandra
Yes, I have experience with Cassandra.
I have been working with Cassandra for the past 2 years.
In my previous project at Lewis, I was responsible for setting up and managing Cassandra clusters. This involved configuring nodes, setting up replication, and ensuring high availability.
I worked on optimizing read and write performance, managing data modeling, and implementing Cassandra query language (CQL) for database operations. Additionally, I handled backup and restore processes and monitored cluster health using tools like nodetool and OpsCenter.

## MongoDB
Yes, I have experience with MongoDB.
In my current role at Shopify, I worked extensively with MongoDB to develop a high-performance backend for a data analytics dashboard. I was responsible for designing the database schema, optimizing queries, and implementing data aggregation pipelines. One notable project involved migrating data from a relational database to MongoDB, which resulted in a 30% improvement in query performance. Additionally, I used MongoDB’s indexing and sharding capabilities to ensure scalability and efficiency as the dataset grew.

## Git
Yes, I have extensive experience with Git.
I have used Git for version control in all my projects over the past 10 years. I am comfortable with all the basic and advanced features of Git.
Besides those basic operations like git clone, git rebase, git checkout. 
I also have integrated Git with CI/CD tools like Jenkins and GitLab CI for automated builds and deployments. I have also used GitHub and GitLab for repository hosting and project management.

## Linux
Yes, I have extensive experience with Linux. 
In my previous roles, I have used Linux for various tasks such as server management, deployment of applications, and shell scripting. For instance, I have managed web servers using Apache and Nginx, automated deployment processes with shell scripts, and monitored system performance using tools like top, htop, and vmstat.
I also set up and maintained a Kubernetes cluster on Linux servers to support a microservices architecture. This involved configuring Docker, managing Kubernetes nodes, and ensuring high availability and security of the services.

I have also worked with Linux-based systems in my current project, a data analytics dashboard. We use Linux servers for hosting our backend services, and I am responsible for maintaining these servers, handling system updates, and troubleshooting any issues that arise.
