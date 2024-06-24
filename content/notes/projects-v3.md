+++
title = 'Projects V3'
date = 2024-06-19T22:42:17-04:00
+++

## Descriptions (3-5 sentences, 30 sec, industry, admin/internal/external/hybrid)
- It's an E-commerce web app where users can browse products, add items to a cart, place orders, and make payments. 
- It supports Role Based Access Control(RBAC) for both internal users to update products price or quantity and external users to browse, search and buy products. 


## Data Flow (frontend data, what kind of payload, what kind of format, design data flow: FE->BE->DB, then we have architecture, then in the middle: add buffering or caching, just add different tools to handle different problem, i.e. failure tolerance, scalability, ....)
- DB
  - Internal User Table (userID, name)
  - External User Table (userID, name)
  - Product Inventory Table (productUID, description, price, quantity)
  - Cart Table (userID, productUID, price, quantity)
  - Order Table (orderID, userID, productID, quantity, price, amount)
  - Credit card Table (userID, card number, billing address, expiration date, cvv)

- FE(internal): add product image, product descriptions, price and quantity.
  - data(out): product info (image + text + numbers)
- BE(internal): add product image to MongoDB, add product meta data into PostgresSQL

- FE(internal): fetch inventory data and manage inventories(delete or update product)
  - data(in): List of products (list of image + text + numbers)
  - data(out): productUID (numbers)

- FE(external): fetch data from the backend
  - data(in): List of (image + text + numbers)

- FE(external): add products into cart, remove products from cart, update product quantity
  - data(out): cart table (userID, productUID)

- FE(external): make order, make payment, receive notification about the order status
  - data(out): 
    - List of orderItem: product idx, price, quantity(numbers)
    - credit card info && save credit card info?(numbers, date, text, boolean)
    - addresses(text)
  - data(in): 
    - order status: successful or failed (numbers)

- BE(external): 
  - data(in):
    - List of orderItem: product idx, price, quantity(numbers)
    - credit card info(numbers, date, text)
    - addresses(text)

- FE(external):
  - data(in && out):
    - order status (number)

- BE(external):
  - data(int && out):
    - order status (number)

## Tech stack(???pros & cons)
### Frontend
- Angular 14.2.5
- Typescript 4.7 for optimal compatibility and features
### Backend
- Java 17
- SpringBoot 2.7.5
- Spring Security 5.7.5
- Spring Data JPA 2.7.5
- Spring Data MongoDB 3.4.5
- Spring Data Redis 2.7.5
- Kafka
  - Spring Kafka 2.8.8
  - Kafka Server 2.8.0
- PostgreSQL
  - JDBC Driver: 42.4.2
  - Database Server 14.5
- MongoDB
  - Java Driver 4.7.1
  - Database Server 5.0
- Redis
  - Spring Data Redis 2.7.5
  - Redis Server 6.2.6
- Swagger
  - Springfox Swagger 3.0.0
### CI/CD and Testing Tools
- Jenkins 2.346.1 (For build pipeline)
- SonarQube (For code quality analysis)
  - Server Version 9.4
  - Scanner Version 4.6.2
- Docker 20.10.7 (For building container images)
- Kubernetes 1.24 (For deploying and managing microservices)
- JUnit 5.8.2
- Selenium
  - Selenium WebDriver 4.4.0
  - Browser Driver(e.g. ChromeDriver) 104.0
### Cloud and Deployment
- AWS (ECS, EKS)
- Docker 20.10.7 (For containerization)
- Kubernetes 1.24 (For orchestration)
### Additional Tools and Libraries
- JWT, Library `jjwt` 0.11.5
- BCrypt, Library `spring-security-crypto` 5.7.5 
- Lombok, 1.18.22

## On-premise or Cloud
- AWS

## ??? Teams ( people we worked with, Agile style/how big the team/what's my role/different scenario we need to talk to different people, who I talked with/ who I suppose to talk with/... )




## Distributed
- "distributed" refers to the architectural approach of breaking down the application into smaller, independent services that communicate with each other over a network.

### Pros
- Scalability: Distributed systems can scale horizontally by adding more instances of individual services rather than scaling up a monolithic application.
- Fault Isolation: Failures in one microservice are isolated, preventing cascading failures across the entire system.
- Flexibility: Teams can choose the most appropriate technology stack for each microservice, optimizing performance and developer productivity.
- Improved Maintainability: Smaller, focused codebases are easier to maintain and update compared to a large monolithic application.

### Cons
- Increased Complexity: Managing multiple microservices introduces complexity in terms of deployment, monitoring, and debugging.
- Consistency: Ensuring data consistency and transaction management across distributed services can be challenging.
- Network Overhead: Communication between microservices over a network can introduce latency and require robust error handling.

### Example scenario in this project
- The User Service handles user authentication and profile management.
- The Product Catalog Service manages product information and inventory.
- The Order Service processes customer orders and manages order fulfillment.
- The Payment Service handles payment processing and integrates with payment gateways.
- The Notification Service sends notifications to users about order status updates.
- Each of these services operates independently but collaborates through well-defined APIs, enabling the platform to deliver a seamless e-commerce experience while benefiting from the scalability and resilience of a distributed architecture.
> Overall, in this project, "distributed" signifies the adoption of a microservices architecture to achieve modularity, scalability, and maintainability in building and operating the e-commerce platform.



## Project: Distributed E-commerce Platform
## Project Overview:
Develop a distributed e-commerce platform where users can browse products, add items to a cart, place orders, and make payments. The platform should also include user authentication and authorization, real-time updates, and analytics.

## Architecture and Technologies:
- Microservices Architecture: Use Spring Boot to create independent services for different functionalities.
- Message Queuing: Use Kafka for communication between services.
- Caching: Use Redis for caching frequently accessed data.
- Cloud Deployment: Deploy services on AWS.
- Front-End: Develop a user interface using Angular.
- Data Persistence: Use PostgreSQL for relational data and MongoDB for NoSQL data.
- API Documentation: Use Swagger for API documentation.
- Continuous Integration/Continuous Deployment (CI/CD): Use Jenkins for CI/CD pipeline.
- Security: Implement security using Spring Security.
- Testing: Write unit tests using JUnit, integrate SonarQube for code quality analysis, and use Selenium for end-to-end testing.

## Detailed Components:
1. User Service:
    - Manages user registration, login, profile management.
    - Technology: Spring Boot, Spring Security, PostgreSQL, JWT for authentication.
2. Product Service:
    - Manages product catalog, including CRUD operations for products.
    - Technology: Spring Boot, MongoDB, Swagger.
3. Order Service:
    - Manages orders, order history, and interactions with the payment service.
    - Technology: Spring Boot, PostgreSQL, Kafka.
4. Cart Service:
    - Manages user cart operations.
    - Technology: Spring Boot, Redis.
5. Payment Service:
    - Manages payment processing.
    - Technology: Spring Boot, external payment gateway integration (e.g., Stripe).
6. Notification Service:
    - Sends real-time notifications to users (e.g., order status updates).
    - Technology: Spring Boot, Kafka.
7. Analytics Service:
    - Collects and analyzes data for business insights.
    - Technology: Spring Boot, MongoDB.
8. Frontend Application:
    - User interface for the e-commerce platform.
    - Technology: Angular, integrating with various backend services.
9. CI/CD Pipeline:
    - Automate testing, build, and deployment processes.
    - Technology: Jenkins, SonarQube, Docker for containerization, AWS for deployment.
10. Testing:
    - Unit Testing: JUnit.
    - End-to-End Testing: Selenium.
    - Code Quality: SonarQube.

## Example Workflow:
1. User Registration and Authentication:
    - User signs up and logs in via the User Service.
    - JWT tokens are generated for authenticated sessions.
2. Product Browsing:
    - User browses products through the Product Service.
    - Product data is cached using Redis for quick access.
3. Shopping Cart:
    - User adds products to the cart.
    - Cart Service manages the cart with Redis to ensure fast performance.
4. Order Placement:
    - User places an order, which triggers the Order Service.
    - Order details are stored in PostgreSQL, and the service sends a message via Kafka to the Payment Service.
5. Payment Processing:
    - Payment Service processes the payment.
    - On successful payment, the Order Service updates the order status and sends a notification via Kafka.
6. Real-Time Notifications:
    - Notification Service sends real-time updates to the user about order status.
7. Analytics:
    - Analytics Service collects data from various services to generate business insights.

## Deployment:
1. AWS Infrastructure:
    - Use AWS EC2 for deploying microservices.
    - Use AWS RDS for PostgreSQL database.
    - Use AWS S3 for static content storage.
    - Use AWS Lambda for serverless computing where applicable.
2. CI/CD with Jenkins:
    - Jenkins pipelines for automated testing, building, and deployment.
    - Integration with SonarQube for code quality analysis.
    - Docker for containerizing microservices.