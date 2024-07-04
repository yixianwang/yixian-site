+++
title = 'Interview Projects'
date = 2024-06-22T21:08:17-04:00
+++

## Guide
![project preparation guide](images-interview/1.png)

### Project Preparation Guide
1. Company Info.
   - Brief company info.
2. Project Name.
   - Why the project exists? What's the main goal?
3. Users.
   - The project is used by whom? How many users approximately?
4. What's the team structure.
   - Agile Team (Scrum Master, Product Owner, Manager, Team Lead, Developers, QA, BA, DBA, DevOps)
5. What's agile scrum flow?
   - Daily meetings, Jira, Planning meeting, demo, review, retrospective
6. Your Main responsibilities.
   - Design, Implement, Test XXX functions, Backend, DB, Frontend?
7. High-level System Structure
   1. TechStack
   2. Environments
   3. Cloud/Platform
   4. Architecture
8. One Specific Functionality.

#### High-Level System Structure Guide
1. TechStack
   - Java version, SpringBoot, REST, What kind of DB, AWS(Cloud), React/Angular, Junit, Mockito
2. Environments
   - Dev, Test, Staging, Production
3. Cloud/Platform
   - Project deployed in AWS or On-premises? CI/CD pipelines?
4. Architecture
   - Draw a chart.
   - Consists of: API Gateway, Service A/B/C, Messaging among services, Database
5. One Specific Functionality
   - As detailed as possible. One or two APIs in detail(method, uri, payload). Service layers, which services are called? how the services communicates(REST, Messaging), where the data is stored(SQL Database, NoSQL, S3 bucket). Chanllenges.

## Project 1: eBay - Data Analytics Dashboard
1. Company Info.
   - eBay is an e-commerce company, that connects buyers and sellers around the world.
2. Project Name.
   - Why the project exists? What's the main goal?
      - The project is used to provide comprehensive insights and analytics to various departments within eBay, such as sales, marketing, product development, and customer support. 
      - The dashboard will aggregate data from different sources, process it in real-time, and present it through interactive and customizable visualizations.
3. Users.
   - The project is used by whom? How many users approximately?
      - This project is only used by internal users.
      - There is about 3,000 users are allowed to access the dashboard with different access level.
4. What's the team structure.
   - Agile Team (Scrum Master, Product Owner, Manager, Team Lead, Developers, QA, BA, DBA, DevOps)
      - 1 Product Manager + Scrum Master
      - 1 BA
      - 1 Project Manger + BE TL
      - BE 1 TL + 7 Dev
      - FE 1 TL + 5 Dev
      - QA 1 TL + 4 QA
      - DBA 2 DBA
      - DevOps 2 DevOps
5. What's agile scrum flow?
   - Daily meetings, Jira, Planning meeting, demo, review, retrospective
      - The PM/SM is responsible for creating and maintaining the Product Backlog, a prioritized list of features, enhancements, and bug fixes required for the product.
      - One single Scrum Spring consists:
      ```
      Product Backlog
           ↓
      Sprint Planning
           ↓
      Sprint Backlog
           ↓
         Sprint Execution (2-4 weeks)
         ↓                 ↓                 ↓
      Daily Scrum      Development       Task Updates
         ↓                 ↓                 ↓
         Sprint Review (end of Sprint)
           ↓
      Product Increment
           ↓
      Sprint Retrospective
           ↓
      Continuous Improvement & Next Sprint Planning
      ```
6. Your Main responsibilities.
   - Design, Implement, Test XXX functions, Backend, DB, Frontend?
      - Work on tasks
      - Design the best solution of the task 
      - Fix program issues
      - Conduct unit tests
      - Collaborate within the team
      - Work with external team
      - For example, I am responsible for designing and implementing the real-time data processing pipeline and integrating it with the frontend dashboard.
7. High-level System Structure
   1. TechStack
      - Java Version: Java 11
      - Spring Boot: Version 2.5
      - Databases: PostgreSQL for transactional data, MongoDB for NoSQL needs
      - AWS (Cloud): EC2, RDS, S3, MSK (Managed Streaming for Apache Kafka), ElastiCache (Redis)
      - Frontend Framework: Angular 11
      - Testing Frameworks: JUnit 5, Mockito
   2. Environments
      - Development (Dev): Where initial development and testing occur.
      - Testing (Test): Used by QA for functional and integration testing.
      - Staging: Pre-production environment where final testing is conducted to mimic the production setup.
      - Production: Live environment where the application is used by internal users.
   3. Cloud/Platform
      - Project deployed in AWS or On-premises? CI/CD pipelines?
         - Deployment: The project is deployed on AWS.
         - CI/CD Pipelines: Jenkins is used for continuous integration and continuous deployment, automating the build, test, and deployment processes across all environments.
   4. Architecture
      - Draw a chart.
      - Consists of: API Gateway, Service A/B/C, Messaging among services, Database
      ```
      +-------------------+       +-------------------+       +-------------------+
      |                   |       |                   |       |                   |
      |     API Gateway   | <---> |  Authentication   | <---> |  User Service     |
      |                   |       |  Service (Spring  |       |  (Spring Boot)    |
      |                   |       |  Boot + Spring    |       |                   |
      +-------------------+       |  Security)        |       +-------------------+
               |                   +-------------------+              |
               |                                                    / \
               |                                                   /   \
               |                                                  /     \
      +-------------------+       +-------------------+       +-------------------+
      |                   |       |                   |       |                   |
      |   Activity        | <---> |  Messaging        | <---> |  Data Processing  |
      |   Service         |       |  Service          |       |  Service          |
      |   (Spring Boot)   |       |  (Kafka)          |       |  (Spring Boot)    |
      |                   |       |                   |       |                   |
      +-------------------+       +-------------------+       +-------------------+
               |                                                    |
               |                                                    |
               v                                                    v
      +-------------------+       +-------------------+       +-------------------+
      |                   |       |                   |       |                   |
      |  PostgreSQL       |       |  Redis (Elasti-   |       |  MongoDB          |
      |  (RDS)            |       |  Cache)           |       |                   |
      |                   |       |                   |       |                   |
      +-------------------+       +-------------------+       +-------------------+
               |
               |
               v
      +-------------------+
      |                   |
      |  S3 (Data Storage)|
      |                   |
      +-------------------+
      ```
   5. One Specific Functionality
      - As detailed as possible. One or two APIs in detail(method, uri, payload). Service layers, which services are called? how the services communicates(REST, Messaging), where the data is stored(SQL Database, NoSQL, S3 bucket). Chanllenges.
8. One Specific Functionality.
   - Functionality: Real-Time User Activity Logging and Analysis
   - Detailed Breakdown:
     1. API Endpoint: Log User Activity
        - Method: POST
        - URI: /api/v1/activity/log
        - Payload:
         ```
         {
            "userId": "12345",
            "activityType": "SEARCH",
            "timestamp": "2024-06-21T10:15:30Z",
            "details": {
               "query": "laptop",
               "resultsCount": 150
            }
         }
         ```
     2. Service Layers:
        - API Gateway: Receives the API request and forwards it to the Authentication Service.
        - Authentication Service: Verifies the user's identity using JWT tokens.
        - Activity Service: Handles the logging of user activity.
           - REST Communication: The API Gateway communicates with the Activity Service via REST.
     3. Internal Communication:
        - Activity Service: Receives the payload and sends it to the Messaging Service (Kafka) for real-time processing.
        - Messaging Service: Publishes the message to the relevant Kafka topic.
        - Data Processing Service: Subscribes to the Kafka topic, processes the message, and stores the processed data.
           - Storage:
              - Transactional Data: Stored in PostgreSQL (RDS) for quick access and querying.
              - Logs and Historical Data: Stored in MongoDB for flexible querying and analysis.
              - Raw Data: Archived in S3 for long-term storage and potential future analysis.
     4. Challenge and Solutions:
        - Real-Time Data Processing: Ensuring low latency in processing high volumes of data. Solved by using Kafka for efficient message streaming and processing.
        - Data Consistency: Maintaining consistency between different databases (PostgreSQL and MongoDB). Used transaction management in Spring and eventual consistency principles.
        - Scalability: Handling increased load as user activity grows. Utilized AWS auto-scaling features for EC2 instances and optimized database queries.
        - Security: Ensuring data security during transit and storage. Implemented encryption (SSL/TLS) and AWS KMS for data at rest.

## Project 2: Lewis Energy Group - Safety Incidents Management
1. Company Info.
   - Lewis Energy is a natural gas drilling company. 
2. Project Name.
   - Why the project exists? What's the main goal?
3. Users.
   - The project is used by whom? How many users approximately?
4. What's the team structure.
   - Agile Team (Scrum Master, Product Owner, Manager, Team Lead, Developers, QA, BA, DBA, DevOps)
      - 1 Product Manager + Scrum Master
      - 1 BA
      - 1 Project Manger + BE TL
      - BE 1 TL + 5 Dev
      - FE 1 TL + 2 Dev
      - QA 1 TL + 1 QA
      - DBA 2 DBA
      - DevOps 1 DevOps
5. What's agile scrum flow?
   - Daily meetings, Jira, Planning meeting, demo, review, retrospective
      - The PM/SM is responsible for creating and maintaining the Product Backlog, a prioritized list of features, enhancements, and bug fixes required for the product.
      ```
      Product Backlog
           ↓
      Sprint Planning
           ↓
      Sprint Backlog
           ↓
         Sprint Execution (2-4 weeks)
         ↓                 ↓                 ↓
      Daily Scrum      Development       Task Updates
         ↓                 ↓                 ↓
         Sprint Review (end of Sprint)
           ↓
      Product Increment
           ↓
      Sprint Retrospective
           ↓
      Continuous Improvement & Next Sprint Planning
      ```
6. Your Main responsibilities.
   - Design, Implement, Test XXX functions, Backend, DB, Frontend?
      - I was in BE team.
      - Write clean, maintainable, and efficient code using Spring Boot, Hibernate, and other back-end technologies.
7. High-level System Structure
   1. TechStack
      - Java version, SpringBoot, REST, What kind of DB, AWS(Cloud), React/Angular, Junit, Mockito
   2. Environments
      - Dev, Test, Staging, Production
   3. Cloud/Platform
      - Project deployed in AWS or On-premises? CI/CD pipelines?
   4. Architecture
      - Draw a chart.
      - Consists of: API Gateway, Service A/B/C, Messaging among services, Database
   5. One Specific Functionality
      - As detailed as possible. One or two APIs in detail(method, uri, payload). Service layers, which services are called? how the services communicates(REST, Messaging), where the data is stored(SQL Database, NoSQL, S3 bucket). Chanllenges.
8. One Specific Functionality.

## Project 3: Citi Bank - Tele Processing System
1. Company Info.
   - It's a banking company.
2. Project Name.
   - Why the project exists? What's the main goal?
3. Users.
   - The project is used by whom? How many users approximately?
4. What's the team structure.
   - Agile Team (Scrum Master, Product Owner, Manager, Team Lead, Developers, QA, BA, DBA, DevOps)
      - 1 Product Manager + Scrum Master
      - 1 BA
      - 1 Project Manger + BE TL
      - BE 1 TL + 5 Dev
      - FE 1 TL + 2 Dev
      - QA 1 TL + 1 QA
      - DBA 2 DBA
      - DevOps 1 DevOps
5. What's agile scrum flow?
   - Daily meetings, Jira, Planning meeting, demo, review, retrospective
      - The PM/SM is responsible for creating and maintaining the Product Backlog, a prioritized list of features, enhancements, and bug fixes required for the product.
      ```
      Product Backlog
           ↓
      Sprint Planning
           ↓
      Sprint Backlog
           ↓
         Sprint Execution (2-4 weeks)
         ↓                 ↓                 ↓
      Daily Scrum      Development       Task Updates
         ↓                 ↓                 ↓
         Sprint Review (end of Sprint)
           ↓
      Product Increment
           ↓
      Sprint Retrospective
           ↓
      Continuous Improvement & Next Sprint Planning
      ```
6. Your Main responsibilities.
   - Design, Implement, Test XXX functions, Backend, DB, Frontend?
      - I was in BE team.
      - Write clean, maintainable, and efficient code using Spring Boot, Hibernate, and other back-end technologies.
7. High-level System Structure
   1. TechStack
      - Java version, SpringBoot, REST, What kind of DB, AWS(Cloud), React/Angular, Junit, Mockito
   2. Environments
      - Dev, Test, Staging, Production
   3. Cloud/Platform
      - Project deployed in AWS or On-premises? CI/CD pipelines?
   4. Architecture
      - Draw a chart.
      - Consists of: API Gateway, Service A/B/C, Messaging among services, Database
   5. One Specific Functionality
      - As detailed as possible. One or two APIs in detail(method, uri, payload). Service layers, which services are called? how the services communicates(REST, Messaging), where the data is stored(SQL Database, NoSQL, S3 bucket). Chanllenges.
8. One Specific Functionality.


```
Sure! Here's a plain English explanation of the project description:
The Tele Processing System is a tool used by Citi Private Banking to help clients move their money. It allows clients to transfer money from their Citi Private Banking accounts to other accounts outside Citi, as well as between their own accounts within Citi Private Banking.
To make these transfers happen, the Tele Processing System works with several other systems, including:

Flex Cube: A core banking system.
CAS: Likely a system for client account services.
CitiFT: Possibly a funds transfer system.
CitiTracs: Likely a transaction tracking system.
CitiSwitch: Possibly a payment processing system.
SEI: Could be a system for investment management.
Project One: Likely an internal project or system.
Document management system: Used for handling and storing documents related to the transfers.
In short, the Tele Processing System connects with various other systems to ensure that money transfers are done smoothly and efficiently for Citi Private Banking clients.
```


## Project 4: Beijing Jishuitan Hospital - Drug Data System
1. Company Info.
   - It's a public hospital in Beijing.
2. Project Name.
   - Why the project exists? What's the main goal?
      - The hospital was planning to modernize and upgrade the current drug data system.
      - The hospital used to have separate data system for both chinese pharmacy and western pharmacy.
      - The goal of this project is to build a brand new drug data system that integrate both chinese pharmacy and western pharmacy. And do the data migration from the old system to the new system.
3. Users.
   - The project is used by whom? How many users approximately?
      - The project is used by both internal user and external user. 
      - There are about more than 2,000 internal users, including doctors and nurses.
      - For the external users, there are about 80,000 patients per year.
4. What's the team structure.
   - Agile Team (Scrum Master, Product Owner, Manager, Team Lead, Developers, QA, BA, DBA, DevOps)
      - 1 Product Manager + Scrum Master
      - 1 BA
      - 1 Project Manger + BE TL
      - BE 1 TL + 5 Dev
      - FE 1 TL + 2 Dev
      - QA 1 TL + 1 QA
      - DBA 2 DBA
      - DevOps 1 DevOps
5. What's agile scrum flow?
   - Daily meetings, Jira, Planning meeting, demo, review, retrospective
      - The PM/SM is responsible for creating and maintaining the Product Backlog, a prioritized list of features, enhancements, and bug fixes required for the product.
      ```
      Product Backlog
           ↓
      Sprint Planning
           ↓
      Sprint Backlog
           ↓
         Sprint Execution (2-4 weeks)
         ↓                 ↓                 ↓
      Daily Scrum      Development       Task Updates
         ↓                 ↓                 ↓
         Sprint Review (end of Sprint)
           ↓
      Product Increment
           ↓
      Sprint Retrospective
           ↓
      Continuous Improvement & Next Sprint Planning
      ```
6. Your Main responsibilities.
   - Design, Implement, Test XXX functions, Backend, DB, Frontend?
      - I was in BE team.
      - Write clean, maintainable, and efficient code using Spring Boot, Hibernate, and other back-end technologies.
7. High-level System Structure
   1. TechStack
      - Java version, SpringBoot, REST, What kind of DB, AWS(Cloud), React/Angular, Junit, Mockito
   2. Environments
      - Dev, Test, Staging, Production
   3. Cloud/Platform
      - Project deployed in AWS or On-premises? CI/CD pipelines?
   4. Architecture
      - Draw a chart.
      - Consists of: API Gateway, Service A/B/C, Messaging among services, Database
   5. One Specific Functionality
      - As detailed as possible. One or two APIs in detail(method, uri, payload). Service layers, which services are called? how the services communicates(REST, Messaging), where the data is stored(SQL Database, NoSQL, S3 bucket). Chanllenges.
8. One Specific Functionality.