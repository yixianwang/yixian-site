+++
title = 'Resume Parts'
date = 2024-07-10T17:42:52-04:00
+++

## Prompt

```
how to convert my the following description into one sentence that I can use in resume: 
"Managed Kubernetes Cluster, meaning AWS will manage the Master Nodes for us. It will create the master nodes. Install all the necessary applications on them, like Container Runtime, Kubernetes Master Processes. It will take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker nodes.
we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose region and VPC, set Security Group for the cluster). 
Then, we have to create worker nodes and connect to the cluster(by creating Node Group, and choose the cluster it attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources. With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has, the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min number of nodes, and we have some other configurations as well.
Finally connect to the cluster from local machine, to deploy our applications from laptop using kubectl, which is k8s command line tool. It basically uses configured kubectl to talk to remote cluster."
```

```Java
please give me similar description that I can use in resume for XXX experience
```

## Java

### DropWizard

- Developed and maintained RESTful web services using DropWizard, ensuring high performance and scalability by
  implementing efficient resource management and optimization techniques.
- Led the integration of DropWizard with various backend systems, enhancing system reliability and simplifying
  deployment processes through robust configuration management and monitoring.

### Spring Boot

### Spring MVC

### Spring Security

### Spring Data JPA

### Hibernate

### Kafka

### Junit

### TestNG

### Selenium

### Cucumber

### Jmeter

### Log4J

### Splunk, Logstash, Kibana

### SonarQube

### Maven

### Tomcat

### SOAP

### JWT

### Oauth2

### J2EE (Java Servlets, JDBC)

### Restful Web Services

### Microservice

### DataDog

### Dynatrace

### Postman

## AWS

### Compute

#### EC2 (Elastic Compute Cloud)

> Understand EC2 instance types, pricing models, Auto Scaling, and best practices.

- Provisioned and managed AWS EC2 instances to deliver scalable compute resources, configured instance types, security
  groups, and storage options, ensuring optimal performance and availability for applications.

#### Lambada

> Familiarity with serverless computing, event-driven architecture, and common use cases.

- Developed and managed AWS Lambda functions by creating and configuring functions, setting up event triggers,
  integrating with other AWS services, optimizing performance, and ensuring scalability and reliability.

#### Elastic Beanstalk

> Managed service for deploying and scaling web applications and services.

- Managed AWS Elastic Beanstalk environments by provisioning and configuring application resources, handling
  auto-scaling and load balancing, deploying applications, and ensuring continuous integration and delivery using CI/CD
  pipelines.

### Storage

#### S3 (Simple Storage Service)

> Knowledge of storage classes, lifecycle policies, access control, and data protection mechanisms.

- Configured and managed AWS S3 for scalable storage solutions, ensuring secure data access and efficient storage
  management with versioning, lifecycle policies, and access control configurations.

#### EBS (Elastic Block Store)

> Understanding of volumes, snapshots, and performance optimization.

#### EFS (Elastic File System)

> Network file system concepts and use cases.

### Databases

#### RDS (Relational Database Service)

> Managed relational databases, including Aurora, MySQL, PostgreSQL, and more.

- Managed AWS RDS instances by creating and configuring databases, optimizing performance, automating backups, ensuring
  high availability and security, and integrating with other AWS services for scalable and reliable database solutions.
- Managed AWS RDS instances by configuring databases, performing automated backups, monitoring performance, and ensuring
  high availability and scalability for production environments.

#### DynamoDB

> NoSQL database, key-value and document store, scaling, and performance optimization.

#### Redshift

> Data warehousing and analytics.

#### ElastiCache

> Managed caching for Redis and Memcached.

### NetWorking

#### VPC (Virtual Private Cloud)

> Network segmentation, subnets, route tables, NAT gateways, and security groups.
> basically our Virtual Private Space in AWS, basically a space where you do your own stuff, it doesn't interfere with
> other AWS users in the cloud. That's basically what VPC is.

- Designed and managed AWS VPCs to create isolated network environments, configure subnets, route tables, and gateways,
  ensuring secure and efficient network communication for applications.

#### Route 53

> DNS service, routing policies, and domain management.

#### API Gateway

> Creating, deploying, and managing APIs.

### Security and Identity

#### IAM (Identity and Access Management)

> Users, roles, policies, and best practices.

##### IAM role

> AWS user

- Designed and managed AWS IAM roles to control access and permissions, ensuring secure and efficient resource
  management across various AWS services.

#### KMS (Key Management Service)

> Managing encryption keys and securing data.

- Implemented and managed AWS KMS by creating and configuring encryption keys, ensuring secure key management,
  integrating with other AWS services for data protection, and enforcing compliance with security policies and best
  practices.

#### Cognito

> User authentication and authorization

### Monitoring and Management

#### CloudWatch

> Monitoring, logging, and alerting.

- Implemented and managed AWS CloudWatch by configuring monitoring and alerting for resources, setting up custom metrics
  and dashboards, analyzing logs, and ensuring system performance and reliability through automated responses and
  insights.

#### CloudTrail

> Logging and auditing AWS API calls.

#### Config

> Resource inventory, configuration history, and change notifications.

### DevOps and CI/CD

#### CodePipeline

> Continuous integration and continuous delivery.

#### CodeBuild

> Build and test code.

#### CodeDeploy

> Automated deployment of applications.

### Analytics and Big Data

#### EMR (Elastic MapReduce)

> Bit data processing using Hadoop, Spark, etc.

#### Athena

> Querying data in S3 using SQL.

#### Kinesis

> Real-time data processing and streaming.

### Machine Learning

#### SageMaker

> Building, training, and deploying machine learning models.

- Implemented and managed machine learning workflows on AWS by setting up and maintaining SageMaker environments,
  configuring EC2 instances for scalable training and inference, and deploying models using automated pipelines and
  endpoint management.

#### Rekognition

> Image and video analysis.

#### Comprehend

> Natural Language Processing.

### Application Integration

#### SQS (Simple Queue Service)

> Messaging queue service.

- Designed and implemented AWS SQS solutions by creating and configuring queues, integrating with other AWS services,
  optimizing message handling, and ensuring reliable and scalable message processing.

#### SNS (Simple Notification Service)

> Messaging and notifications.

- Designed and managed AWS SNS by creating and configuring topics, setting up subscriptions, integrating with other AWS
  services, optimizing notification delivery, and ensuring reliable and scalable message broadcasting.

#### Step Function

> Orchestration of serverless workflows.

### Architecture Best Practices

#### Well-Architected Framework

> Understanding the pillars of operational excellence, security, reliability, performance efficiency, and cost
> optimization.

#### Microservices

> Designing and deploying microservices on AWS

### General Concepts

#### Infrastructure as Code (IaC)

> Using AWS CloudFormation or Terraform

#### Cost Management

> Best practices for cost optimization and monitoring

#### Disaster Recovery

> Strategies for backups, failover, and resilience.

### Others

### Security Group

> a list of permissions

- Configured and managed AWS Security Groups to control inbound and outbound traffic, ensuring secure network
  communication for applications and compliance with security policies.

#### ECS

- Managed and deployed containerized applications using AWS ECS, configuring clusters, task definitions, and service
  scaling to ensure high availability and efficient resource utilization.

#### EKS

> Managed Kubernetes Cluster, meaning AWS will manage the **Master Nodes** for us. It will create the master nodes.
> Install all the necessary applications on them, like **Container Runtime**, Kubernetes **Master Processes**. It will
> take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good
> idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without
> worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker
> nodes.

> **we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose
> region and VPC, set Security Group for the cluster).
> **Then, we have to create worker nodes and connect to the cluster**(by creating Node Group, and choose the cluster it
> attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances
> should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources.
> With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has,
> the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min
> number of nodes, and we have some other configurations as well.
> **Finally connect to the cluster from local machine,** to deploy our applications from laptop using `kubectl`, which
> is k8s command line tool. It basically uses configured `kubectl` to talk to remote cluster.

> Cons: complex comparing to Linux K8s Engine and Digital Ocean K8s.
> Pros: powerful, popular.

> `eksctl` one single eks single command, it basically does all above steps in background. Configuration will use
> default values. We can override configurations via parameters. But we still have one command.

- Managed AWS EKS cluster by overseeing the creation and maintenance of master nodes, configuring worker nodes with
  auto-scaling EC2 instances, and deploying applications using kubectl and eksctl.

#### CloudFormation

- Developed and maintained AWS CloudFormation templates by defining infrastructure as code, automating resource
  provisioning, ensuring consistent environments, and managing stack updates and rollbacks for scalable and reliable
  deployments.

## Python

### Python Script

- Developed and maintained Python scripts for automating data processing tasks, and improving workflow efficiency, while
  ensuring code quality through testing and version control.
- Developed and maintained Python scripts for automation, data analysis, and process optimization, and improved
  efficiency and accuracy of repetitive tasks.

### Machine Learning

- Developed and deployed machine learning models by managing data preprocessing, feature engineering, model training,
  and evaluation, utilizing cloud platforms for scalable computing resources, and integrating models into production
  environments to ensure continuous performance monitoring and optimization.

#### Pytorch

- Developed and deployed deep learning models using PyTorch, performed data preprocessing and augmentation, optimized
  model performance, and collaborated with research and engineering teams to implement scalable solutions for various
  machine learning tasks.
- Developed and optimized deep learning models using PyTorch, implemented data preprocessing pipelines, and trained
  models on large datasets to achieve high performance and accuracy.

#### Sklearn

- Implemented and optimized machine learning models using Scikit-learn, conducted data preprocessing and feature
  engineering, and performed model evaluation and tuning to achieve high predictive accuracy.

### pySpark

- Developed and optimized large-scale data processing pipelines using PySpark, performed data cleansing and
  transformation, implemented complex algorithms for data analysis, and collaborated with data engineering teams to
  ensure efficient data flow and integration within a distributed computing environment.
- Developed and optimized data processing workflows using PySpark, implemented ETL processes on large-scale datasets,
  and performed distributed computing tasks to enhance data analysis efficiency and scalability.

### PyTest

- Designed and implemented comprehensive test suites using PyTest to ensure the reliability and performance of
  applications, developed automated test scripts for functional and regression testing.

### Unittest

- Designed and implemented unit tests using the Unittest framework in Python to ensure code quality and reliability,
  created comprehensive test cases for various functionalities, automated testing processes.

### Numpy

- Utilized NumPy to perform high-performance numerical computations, developed efficient algorithms for data
  manipulation and analysis, optimized data processing workflows, and collaborated with data science teams to implement
  and test statistical models and simulations.
- Utilized NumPy for efficient numerical computations, performed data manipulation and analysis, and optimized
  performance of scientific computing tasks through array operations and vectorization techniques.

### Pandas

- Utilized Pandas to perform data manipulation, analysis, and visualization, developed efficient data processing
  workflows, cleaned and transformed large datasets, and collaborated with data science teams to derive actionable
  insights and support data-driven decision-making.
- Leveraged Pandas for data manipulation and analysis, performed data cleaning, transformation, and aggregation, and
  optimized workflows for handling large datasets to enhance data-driven decision-making.

### Scikit-learn

- Developed and implemented machine learning models using Scikit-learn, leveraging algorithms such as linear regression,
  decision trees, and k-nearest neighbors to analyze and predict data trends, resulting in a 15% increase in prediction
  accuracy.
- Utilized Scikit-learn for data preprocessing, feature selection, and model evaluation, enabling efficient and
  effective development of predictive analytics solutions that improved decision-making processes and operational
  efficiency.

### Dash

- Developed interactive data visualization dashboards using Dash and Plotly, enabling real-time data analysis and
  decision-making for business stakeholders. Integrated data from various sources, including SQL databases and APIs, to
  provide comprehensive insights and actionable metrics.
- Implemented and optimized Dash applications to display complex data sets through intuitive visualizations and
  user-friendly interfaces. Focused on enhancing performance, usability, and responsiveness to ensure seamless user
  experiences across different devices and platforms.

### Dask

- Optimized data processing workflows by implementing Dask for distributed computing, significantly improving the
  performance and scalability of large-scale data analytics tasks.
- Developed and deployed efficient data pipelines using Dask, enabling parallel processing of complex datasets and
  reducing overall computation time in data-intensive projects.

### Flask

- Developed and maintained robust web applications using Flask, implementing RESTful APIs, integrating with various
  databases, and ensuring efficient request handling and response processing to optimize performance and user
  experience.
- Designed and deployed scalable Flask-based microservices, focusing on application security, session management, and
  seamless integration with front-end frameworks, resulting in improved application stability and responsiveness.

### Boto3

- Automated AWS infrastructure management by developing Python scripts with Boto3 to provision, configure, and maintain
  services such as EC2, S3, and RDS, resulting in improved operational efficiency and reduced manual intervention.
- Enhanced cloud operations through the integration of Boto3, enabling seamless interaction with AWS services,
  automating resource scaling, and implementing robust monitoring and alerting solutions for optimized performance and
  cost management.

## SQL

### PostgresSQL

- Designed, developed, and optimized PostgreSQL databases, implemented complex SQL queries and stored procedures, and
  ensured database performance, security, and scalability for application development projects.

### Oracle

- Developed and maintained Oracle databases, implemented complex PL/SQL scripts and stored procedures, optimized
  database performance, and ensured data integrity and security in support of business operations.

### MySQL

- Designed, developed, and maintained MySQL databases, optimized query performance, implemented data models, and ensured
  data integrity and security in high-traffic applications.

## NoSQL

### AWS DynamoDB

- Table
- Item
- Attribute
- Primary Key
- Partition Key
- Sort Key
- Global Secondary Index

### AWS ElasticCache

### Redis

### MongoDB

### Cassandra

### GraphQL

## ElasticSearch

## HTML & CSS

## Typescript

### Angular
- Collaborated with cross-functional teams to design and integrate RESTful APIs in Angular applications, leveraging Angular services, routing, and dependency injection to ensure efficient data flow and seamless user interactions.

### Bootstrap

### Material UI

## Javascript

### React

### jQuery

## C++

### CUDA

## Go (Golang)

## Devops

### Git

### GitLab

### GitHub

### Bitbucket

- Implemented and managed Bitbucket repositories for version control, ensuring efficient code collaboration and
  integration across development teams by utilizing pull requests, branch management, and code reviews.

### Jenkins

### Bamboo

- Implemented and maintained continuous integration and continuous deployment (CI/CD) pipelines using Bamboo,
  streamlining the build, test, and release process, resulting in a 30% reduction in deployment time and improved
  software quality.
- Developed custom build plans and automated workflows in Bamboo, ensuring seamless integration with version control
  systems and facilitating efficient collaboration among development teams.

### Artifactory

- Implemented and managed Artifactory for artifact storage and distribution, ensuring seamless integration with CI/CD
  pipelines, leading to improved build efficiency and artifact version control.
- Configured and maintained Artifactory repositories for multiple projects, enabling secure and efficient artifact
  management, versioning, and retrieval across development teams.
- Optimized build and deployment processes by leveraging Artifactory's capabilities for storing and managing Docker
  images, Maven, and npm packages, resulting in enhanced workflow automation and reduced downtime.### Concourse

### Ansible

- Developed and maintained Ansible playbooks to automate the deployment, configuration, and management of cloud
  infrastructure across multiple environments, ensuring consistency and reducing manual intervention.
- Implemented continuous integration and continuous deployment (CI/CD) pipelines using Ansible to automate application
  deployment, configuration updates, and system patching, significantly improving deployment speed and reliability.
- Led the migration of legacy infrastructure to an automated environment by creating Ansible roles and playbooks, which
  improved scalability, reduced downtime, and enhanced system performance through efficient resource management.

### Airflow

### Jira

### Confluence

## Docker

## Kubernetes

## Design Pattern

### Singleton

### Proxy

### Factory

### Builder

### MVC

### DAO

## Linux

## Big Data

### Hadoop

### Spark

### HDFS

### Hive

### Kafka

## Skills - Long

Languages: Java, C++, SQL, TypeScript, JavaScript, Python, Go.
Databases: PostgreSQL, Oracle, MySQL, Hive, Redis, MongoDB, Cassandra, AWS RDS, AWS DynamoDB.
Frameworks: Spring Boot, Spring MVC, Spring Security, Spring Data JPA, Hibernate, Kafka, Junit, TestNG, Selenium.
Cloud Service: AWS (EC2, S3, ECS, EKS, RDS, DynamoDB, SNS, SQS, Lambda, Fargate, KMS, CloudWatch).
Frontend Technologies: Angular 10+, HTML, CSS, Bootstrap, Material UI, jQuery.
Web Technologies: J2EE (Java Servlets, JDBC), RESTful Web Services, SOAP, JWT, Oauth2.
Design Patterns: Singleton, Factory, Builder, Proxy, MVC, DAO.
Dev/Ops: Git, Docker, Kubernetes, Jenkins, GitHub, GitLab, Linux, Bash.
IDE & Tools: IntelliJ IDEA, WebStorm, VS Code, Maven, Jira, Splunk, Logstash, Kibana.
AI / ML / HPC: Pytorch, Sklearn, Pandas, Numpy, CUDA.

## Skills - Short

Technical Skills: Java, SQL, TypeScript, JavaScript, Python, Go, C++, HTML, CSS, Spring Boot, Spring MVC, Spring
Security, Spring Data JPA, Hibernate, Kafka, Junit, TestNG, Selenium, PostgreSQL, Oracle, MySQL, Hive, Redis, MongoDB,
Cassandra, Angular, Bootstrap, Angular Material, jQuery, AWS (EC2, S3, ECS, EKS, RDS, DynamoDB, SNS, SQS, Lambda,
Fargate, KMS, CloudWatch).
Tools & Knowledge: J2EE (Java Servlets, JDBC), RESTful Web Services, JWT, Oauth2, Maven, Jira, Splunk, Logstash, Kibana,
Git, Docker, Kubernetes, Jenkins, GitHub, GitLab, Linux, Bash, Pytorch, Sklearn, Pandas, Numpy, CUDA.

## Question: Do you have Cassandra experience?

### Scenario 1: You Have Experience with Cassandra

1. **Start with a Confirmation:**
   - "Yes, I have experience with Cassandra."

2. **Mention the Duration:**
   - "I have been working with Cassandra for the past [X] years/months."

3. **Describe Your Role and Responsibilities:**
   - "In my previous project, I was responsible for setting up and managing Cassandra clusters. This involved
     configuring nodes, setting up replication, and ensuring high availability."

4. **Highlight Specific Tasks:**
   - "I worked on optimizing read and write performance, managing data modeling, and implementing Cassandra query
     language (CQL) for database operations. Additionally, I handled backup and restore processes and monitored cluster
     health using tools like nodetool and OpsCenter."

5. **Discuss Relevant Projects:**
   - "One notable project was [briefly describe the project], where we used Cassandra to handle large-scale data for
     real-time analytics. My role included designing the schema, ensuring data consistency, and optimizing query
     performance."

6. **Mention Challenges and Solutions:**
   - "One challenge we faced was [describe a challenge], and to overcome it, we [describe the solution]. This improved
     our system's reliability and performance significantly."

7. **Conclude with Your Enthusiasm:**
   - "Overall, I found Cassandra to be a robust and scalable solution for our needs, and I'm keen to leverage my
     experience in Cassandra to contribute to your team."

### Scenario 2: You Have Limited or Indirect Experience with Cassandra

1. **Be Honest:**
   - "I have limited experience with Cassandra."

2. **Explain Your Level of Exposure:**
   - "I have worked on a project where Cassandra was used as the primary database, and while I wasn't directly
     responsible for managing it, I collaborated closely with the database team."

3. **Highlight Related Skills:**
   - "I am familiar with NoSQL databases and concepts, having worked extensively
     with [mention any other NoSQL databases you have experience with, e.g., MongoDB, DynamoDB]. This includes data
     modeling, query optimization, and handling large datasets."

4. **Mention Learning Efforts:**
   - "To expand my knowledge, I have completed an online course on Cassandra and have experimented with it in my
     personal projects. I set up a small cluster and performed basic operations using CQL."

5. **Express Willingness to Learn:**
   - "I am enthusiastic about deepening my expertise in Cassandra and am confident that my background in NoSQL databases
     will help me quickly get up to speed."

### Scenario 3: You Have No Experience with Cassandra

1. **Be Honest:**
   - "I haven't had the opportunity to work with Cassandra directly."

2. **Highlight Related Experience:**
   - "However, I have extensive experience with NoSQL databases like MongoDB and DynamoDB. I understand the principles
     of distributed databases, data modeling, and managing large-scale data."

3. **Show Willingness to Learn:**
   - "I am very interested in learning Cassandra and have already started going through online resources and
     documentation to familiarize myself with its architecture and operations."

4. **Connect with Relevant Skills:**
   - "Given my strong background in [mention relevant technologies or skills], I am confident that I can quickly adapt
     to using Cassandra in a professional setting."

5. **Express Enthusiasm:**
   - "I am eager to expand my skill set to include Cassandra and believe that my existing knowledge of NoSQL databases
     will be a strong foundation for learning it effectively."

### General Tips

- **Be Honest:** Never exaggerate your experience. Interviewers appreciate honesty and a willingness to learn.
- **Be Specific:** Provide concrete examples and details about your experience and knowledge.
- **Show Enthusiasm:** Demonstrate your interest in Cassandra and your commitment to expanding your skills.
- **Relate to the Role:** Connect your experience with Cassandra (or lack thereof) to the responsibilities of the
  position you are applying for.
