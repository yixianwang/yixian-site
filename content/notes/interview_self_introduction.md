+++
title = 'Self Introduction'
date = 2024-06-26T17:02:29-04:00
draft = true
+++

## 1. Self Introduction
My name is Austin. I have been working as a Java developer for over 6 years, and primarily focusing on Backend Development, and the MicroService architecture.

My expertise basically like the core java concept,
and (I am) familiar with those popular frameworks such as Spring Boot, Spring MVC, Spring Security, Spring Data JPA, Hibernate, Kafka, JUnit, and so on.
And for front-end, I have experience using React and also Angular.
I also have hands-on experience on building robust MicroService architecture.
> just add a brief idea like what industry have I participated in. like what project I have worked on.

## 2. My most recent project
In my most recent project I contribute(d) to a system called ADS, which is stand for Analytics Dashboard System.
And it is designed to satisfy the company’s data analysis needs. 
And Initially the ADS was designed in a monolithic architecture. 
And my project is aim to basic decompose the whole architecture into MicroService. 
And to enhance the scalability and flexibility of the whole system.

I am in charge of the order functionality for this project, including order trending service, real-time order analysis service, and promotion analysis service.
The order functionalities basically is handle like the order data on different dimensions for analysis purpose.

the order trending MS, it handles the order trending data over time in (daily, weekly, monthly, and so on).
and order real-time MS, like during some sales event, it handles real-time ordering data.
and promotion MS, it handles the data like the revenue and customer retention rate improvement and so on.
It also contains report service that will generate comprehensive report.

This whole architecture shape basically enhance the whole systems’ scalability, flexibility, and maintainability. 
And also enhance the data management process.

In terms of my tech stack, I specialize in backend Restful API using Java and Spring Boot and alongside with the Spring Data JPA, and Hibernate for data management, and JUnit, TestNG and Selenium for Test Strategy. 
For the MicroService I have intensely use Kafka to build like the event driven and support the real-time update.
And I primarily work with the PostgreSQL database. But I also have experience with non-sql type of database.
For front-end, I use Angular to create frontend user interface for different modules, so for current project I basically worked on order related modules, and services.

## 3. Talk about the biggest challenge in my project.
So the biggest challenge in the ADS project, is basically I worked on the enhance performance for one of our API endpoints. 
It’s called like customer retention rate analysis service in the Promotion MicroService. 
And as our company is going bigger this year. And we have experience like database query delay to this specific endpoint. 
And it often cause like a performance issue. And sometimes it overloads our database, and even occasionally crash our database.

I discussed this problem with my team lead. And he proposed like may be we could try to kind of to use like Elastic Search. 
And Elastic Search is kind of new technology for like for the team and also for me. 
And we do have like the other team which working on the e-commerce websites to use ElasticSearch. Since our e-commerce website is basically for like unstructured data and will have a lot of like filter stuff. 
But for like this specific customer retention rate analysis endpoint, is basically we need it fast response time. 
So first of all I have a team meeting with all team members and my manager. 
To aligns up may be we need to try this kind of approach. 
I just want to make sure that everyone is on the same page. 
And I also go the person like who is working on the e-commerce website, to kind of like talk about my implementation and to see like if this approach is on track. 
And he gave me like a remind me a tool like called OpenDistro which can help me to like convert like SQL statements to ElasticSearch queries. 
And we did try that approach, however like, it’s still like causing sometime random chaos in our system. 
So I did the further research and we just determined that we may be we should just try to use the native ElasticSearch queries. 
And I work closely with my team lead. 
And we basically migrate that old MySQL database for the Customer to ElasticSearch. 
Using ElasticSearch as the backend. 
And we have successfully launched this enhanced feature like in two months. 
I feel like this is gonna be the most challenge part I found in my project.

## Angular Phone Interview
Okay, I use Angular in both my current project and previous project.

So for the current project, it's a dashboard system. I use Angular to build frontend for different modules, I basically worked on order related modules, and services. This involves integrating different APIs to fetch data, and create UI components. And I also implemented data visualizations using D3 and Chart external libraries in Angular.

And in my previous projects, I also used Angular for the frontend, with NgRx for state management, and Angular Material for the UI part.
