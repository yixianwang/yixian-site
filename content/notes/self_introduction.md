+++
title = 'Self Introduction'
date = 2024-06-26T17:02:29-04:00
draft = true
+++
// 1. Self Introduction

My name is Austin. I have been working as a Java developer for over 6 years, and primarily focusing on like Full Stack Development, and the MicroService architecture.

And my expertise basically like  
the core java concept,
and (I am) familiar with popular framework such as SpringBoot, and Hibernate.
And for front-end, I have experience using React and also Angular.
And also I have hands-on experience on building robust(ic) MicroService architecture.
> just add a brief idea like what industry have I participated in. like what project I have worked on.

// 2. My most recent project

And in my most recent project I contribute(d) to a system called ADS, which is stand for Analytics Dashboard System.
And it is designed to satisfy the company’s data analysis needs. And Initially the ADS was designed in a monolithic architecture. And my project is aim to basic decompose the whole architecture into MicroService. And to enhance the scalability and flexibility of the whole system.

I am in charge of the order and customer functionality for this project. The order basically, the order MicroService basically is handle like the order analysis on different dimensions, and it will handle like the data for specific vip level of the user, status of the order, and also many other different order dimensions.
And the meanwhile the customer MicroService basically handling the customer data like including new registered customer analysis, customer retention rate analysis. It will also generate the customer satisfaction analysis report, and also provides advertisement recommendation service.

This whole like architecture ship basically like enhance like the whole systems’ scalability, flexibility, and maintainability. And also enhance the data management process.

In terms of my tech stack, I specialize in right team backend Restful API using Java and Spring Boot and alongside with the Spring Data JPA, and Hibernate for data management. And I primarily work with the MySQL database. But I also have experience with other non-sql type of database. On front-end, I utilize like Angular to create intuitive user frontend for different modules, so for this project I basically worked on rates management and route management. And additionally in my previous projects, I have been using like the Angular for building responsive user interface, and NgRx for state management, and Angular Material for designing style. For the MicroService I have intensely use Kafka to build like the event driven and support the real-time update.

I appreciate the opportunity to discuss like the my skills and my experience, which I hope I could fulfill the company needs. And Yeah, the should be all.

// 3. Talk about the biggest challenge in my project.

So the biggest challenge in the ADS project, is basically I worked on the enhance performance for one of our API endpoints. It’s called like customer retention rate analysis service in the Customer MicroService, and as our company is going bigger this year. And we have experience like database query delay to this specific endpoint. And it often cause like a performance issue. And sometimes it overloads our database, and even occasionally crash our database.

I discussed this problem with my team lead. And he proposed like may be we could try to kind of to use like Elastic Search. And Elastic Search is kind of new technology for like for the team and also for me. And we do have like the other team which working on the e-commerce websites to use ElasticSearch. Since our e-commerce website is basically for like unstructured data and will have a lot of like filter stuff. But for like this specific customer retention rate analysis endpoint, is basically we need it fast response time. So first of all I have a team meeting with all team members and my manager. To aligns up may be we need to try this kind of approach. I just want to make sure that everyone is on the same page. And I also go the person like who is working on the e-commerce website, to kind of like talk about my implementation and to see like if this approach is on track. And he gave me like a remind me a tool like called OpenDistro which can help me to like convert like SQL statements to ElasticSearch queries. And we did try that approach, however like, it’s still like causing sometime random chaos in our system. So I did the further research and we just determined that we may be we should just try to use the native ElasticSearch queries. And I work closely with my team lead. And we basically migrate that old MySQL database for the Customer to ElasticSearch. Using ElasticSearch as the backend. And we have successfully launched this enhanced feature like in two months. I feel like this is gonna be the most challenge part I found in my project. 
