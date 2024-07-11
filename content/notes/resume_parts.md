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
### S3
### VPC
> basically our Virtual Private Space in AWS, basically a space where you do your own stuff, it doesn't interfere with other AWS users in the cloud. That's basically what VPC is.
### IAM role
> AWS user
### Security Group
> a list of permissions
### ECS
## EKS
> Managed Kubernetes Cluster, meaning AWS will manage the **Master Nodes** for us. It will create the master nodes. Install all the necessary applications on them, like **Container Runtime**, Kubernetes **Master Processes**. It will take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker nodes.

> **we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose region and VPC, set Security Group for the cluster). 
> **Then, we have to create worker nodes and connect to the cluster**(by creating Node Group, and choose the cluster it attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources. With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has, the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min number of nodes, and we have some other configurations as well.
> **Finally connect to the cluster from local machine,** to deploy our applications from laptop using `kubectl`, which is k8s command line tool. It basically uses configured `kubectl` to talk to remote cluster.

> Cons: complex comparing to Linux K8s Engine and Digital Ocean K8s. 
> Pros: powerful, popular.

> `eksctl` one single eks single command, it basically does all above steps in background. Configuration will use default values. We can override configurations via parameters. But we still have one command.
### RDS
### SNS
### SQS
### Lambada
### Elastic Beanstalk
### KMS
### CloudWatch
### CloudFormation

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