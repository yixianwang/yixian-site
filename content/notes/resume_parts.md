+++
title = 'Resume Parts'
date = 2024-07-10T17:42:52-04:00
+++

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

## Python
### Python Script
### Machine Learning
#### Pytorch
#### Sklearn
### pySpark
### PyTest
### Unittest
### Numpy
### Pandas

## SQL
### AWS RDS
### PostgresSQL
### Oracle
### MySQL

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