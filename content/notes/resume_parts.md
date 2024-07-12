+++
title = 'Resume Parts'
date = 2024-07-10T17:42:52-04:00
+++

## Prompt
```
how to convert my the following description into one sentence that I can use in resume: "> Managed Kubernetes Cluster, meaning AWS will manage the **Master Nodes** for us. It will create the master nodes. Install all the necessary applications on them, like **Container Runtime**, Kubernetes **Master Processes**. It will take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker nodes.

> **we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose region and VPC, set Security Group for the cluster). 
> **Then, we have to create worker nodes and connect to the cluster**(by creating Node Group, and choose the cluster it attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources. With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has, the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min number of nodes, and we have some other configurations as well.
> **Finally connect to the cluster from local machine,** to deploy our applications from laptop using kubectl, which is k8s command line tool. It basically uses configured kubectl to talk to remote cluster."
```

```Java
please give me similar description that I can use in resume for XXX experience
```

## Java
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
### EC2
- Provisioned and managed AWS EC2 instances to deliver scalable compute resources, configured instance types, security groups, and storage options, ensuring optimal performance and availability for applications.

### S3
- Configured and managed AWS S3 for scalable storage solutions, ensuring secure data access and efficient storage management with versioning, lifecycle policies, and access control configurations.

### VPC
> basically our Virtual Private Space in AWS, basically a space where you do your own stuff, it doesn't interfere with other AWS users in the cloud. That's basically what VPC is.
- Designed and managed AWS VPCs to create isolated network environments, configure subnets, route tables, and gateways, ensuring secure and efficient network communication for applications.

### IAM role
> AWS user
- Designed and managed AWS IAM roles to control access and permissions, ensuring secure and efficient resource management across various AWS services.

### Security Group
> a list of permissions
- Configured and managed AWS Security Groups to control inbound and outbound traffic, ensuring secure network communication for applications and compliance with security policies.

### ECS
- Managed and deployed containerized applications using AWS ECS, configuring clusters, task definitions, and service scaling to ensure high availability and efficient resource utilization.

### EKS
> Managed Kubernetes Cluster, meaning AWS will manage the **Master Nodes** for us. It will create the master nodes. Install all the necessary applications on them, like **Container Runtime**, Kubernetes **Master Processes**. It will take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker nodes.

> **we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose region and VPC, set Security Group for the cluster). 
> **Then, we have to create worker nodes and connect to the cluster**(by creating Node Group, and choose the cluster it attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources. With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has, the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min number of nodes, and we have some other configurations as well.
> **Finally connect to the cluster from local machine,** to deploy our applications from laptop using `kubectl`, which is k8s command line tool. It basically uses configured `kubectl` to talk to remote cluster.

> Cons: complex comparing to Linux K8s Engine and Digital Ocean K8s. 
> Pros: powerful, popular.

> `eksctl` one single eks single command, it basically does all above steps in background. Configuration will use default values. We can override configurations via parameters. But we still have one command.

- Managed AWS EKS cluster by overseeing the creation and maintenance of master nodes, configuring worker nodes with auto-scaling EC2 instances, and deploying applications using kubectl and eksctl.

### RDS
- Managed AWS RDS instances by creating and configuring databases, optimizing performance, automating backups, ensuring high availability and security, and integrating with other AWS services for scalable and reliable database solutions.
- Managed AWS RDS instances by configuring databases, performing automated backups, monitoring performance, and ensuring high availability and scalability for production environments.

### DynamoDB

### SNS
- Designed and managed AWS SNS by creating and configuring topics, setting up subscriptions, integrating with other AWS services, optimizing notification delivery, and ensuring reliable and scalable message broadcasting.

### SQS
- Designed and implemented AWS SQS solutions by creating and configuring queues, integrating with other AWS services, optimizing message handling, and ensuring reliable and scalable message processing.

### Lambada
- Developed and managed AWS Lambda functions by creating and configuring functions, setting up event triggers, integrating with other AWS services, optimizing performance, and ensuring scalability and reliability.

### Elastic Beanstalk
- Managed AWS Elastic Beanstalk environments by provisioning and configuring application resources, handling auto-scaling and load balancing, deploying applications, and ensuring continuous integration and delivery using CI/CD pipelines.

### KMS
- Implemented and managed AWS KMS by creating and configuring encryption keys, ensuring secure key management, integrating with other AWS services for data protection, and enforcing compliance with security policies and best practices.

### CloudWatch
- Implemented and managed AWS CloudWatch by configuring monitoring and alerting for resources, setting up custom metrics and dashboards, analyzing logs, and ensuring system performance and reliability through automated responses and insights.

### CloudFormation
- Developed and maintained AWS CloudFormation templates by defining infrastructure as code, automating resource provisioning, ensuring consistent environments, and managing stack updates and rollbacks for scalable and reliable deployments.

### SageMaker
- Implemented and managed machine learning workflows on AWS by setting up and maintaining SageMaker environments, configuring EC2 instances for scalable training and inference, and deploying models using automated pipelines and endpoint management.

## Python
### Python Script
- Developed and maintained Python scripts for automating data processing tasks, and improving workflow efficiency, while ensuring code quality through testing and version control.
- Developed and maintained Python scripts for automation, data analysis, and process optimization, and improved efficiency and accuracy of repetitive tasks.

### Machine Learning
- Developed and deployed machine learning models by managing data preprocessing, feature engineering, model training, and evaluation, utilizing cloud platforms for scalable computing resources, and integrating models into production environments to ensure continuous performance monitoring and optimization.

#### Pytorch
- Developed and deployed deep learning models using PyTorch, performed data preprocessing and augmentation, optimized model performance, and collaborated with research and engineering teams to implement scalable solutions for various machine learning tasks.
- Developed and optimized deep learning models using PyTorch, implemented data preprocessing pipelines, and trained models on large datasets to achieve high performance and accuracy.

#### Sklearn
- Implemented and optimized machine learning models using Scikit-learn, conducted data preprocessing and feature engineering, and performed model evaluation and tuning to achieve high predictive accuracy.

### pySpark
- Developed and optimized large-scale data processing pipelines using PySpark, performed data cleansing and transformation, implemented complex algorithms for data analysis, and collaborated with data engineering teams to ensure efficient data flow and integration within a distributed computing environment.
- Developed and optimized data processing workflows using PySpark, implemented ETL processes on large-scale datasets, and performed distributed computing tasks to enhance data analysis efficiency and scalability.

### PyTest
- Designed and implemented comprehensive test suites using PyTest to ensure the reliability and performance of applications, developed automated test scripts for functional and regression testing.

### Unittest
- Designed and implemented unit tests using the Unittest framework in Python to ensure code quality and reliability, created comprehensive test cases for various functionalities, automated testing processes.

### Numpy
- Utilized NumPy to perform high-performance numerical computations, developed efficient algorithms for data manipulation and analysis, optimized data processing workflows, and collaborated with data science teams to implement and test statistical models and simulations.
- Utilized NumPy for efficient numerical computations, performed data manipulation and analysis, and optimized performance of scientific computing tasks through array operations and vectorization techniques.

### Pandas
- Utilized Pandas to perform data manipulation, analysis, and visualization, developed efficient data processing workflows, cleaned and transformed large datasets, and collaborated with data science teams to derive actionable insights and support data-driven decision-making.
- Leveraged Pandas for data manipulation and analysis, performed data cleaning, transformation, and aggregation, and optimized workflows for handling large datasets to enhance data-driven decision-making.

## SQL
### PostgresSQL
- Designed, developed, and optimized PostgreSQL databases, implemented complex SQL queries and stored procedures, and ensured database performance, security, and scalability for application development projects.

### Oracle
- Developed and maintained Oracle databases, implemented complex PL/SQL scripts and stored procedures, optimized database performance, and ensured data integrity and security in support of business operations.

### MySQL
- Designed, developed, and maintained MySQL databases, optimized query performance, implemented data models, and ensured data integrity and security in high-traffic applications.

## NoSQL
### AWS DynamoDB
### Redis
### MongoDB
### Cassandra
### GraphQL

## ElasticSearch

## HTML & CSS

## Typescript
### Angular
### Bootstrap
### Material UI

## Javascript
### React
### jQuery

## C++
### CUDA

## Go (Golang)

## Git
## GitLab
## GitHub
## Jenkins
## Concourse
## Airflow
## Jira
## Confluence

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