+++
title = 'Finra'
date = 2024-07-11T15:17:50-04:00
draft = true
+++

## Prompt
```
I am preparing an interview for SDET position. I will interview with a company's tech lead. 
My background is like: "I have been working as a Java developer for over 6 years, and primarily focusing on Backend Development, and the MicroService architecture. My expertise basically like the core java concept, and (I am) familiar with those popular frameworks such as Spring Boot, Spring MVC, Spring Security, Spring Data JPA, Hibernate, Kafka, JUnit, and so on. And for front-end, I have experience using React and also Angular. I also have hands-on experience on building robust MicroService architecture."
The job description I got from the HR: "Requirements :
- **Junit** and **TestNG** experience
- Automation testing experience with **Selenium**
- Demonstrated hands-on experience writing basic **SQL** queries using joins and aggregate functions
- QA mindset: unit, integration, smoke, regression, performance, security, scalability, reliability, failure tolerance, TDD, BDD, etc.".
I have a problems list that I need to prepare for this position. I will put them to here one by one. And please give me the proper answer for each question I put here based on my background. The answer you gave me should be in the first person statement. When the tech stacks in the job description that I can use in the answer, please use them in your answer.
```

## Summary:
- Our client, a large financial regulator, is looking to bring on a Mid-Level SDET to support QA functions on multiple projects.
- A software engineer who has coded in Java with a testing mindset will be the ideal candidate for this role.

## Requirements :
- 4+ years of experience in Java development.
- **Junit** and **TestNG** experience
- Automation testing experience with **Selenium**
- Demonstrated hands-on experience writing basic **SQL** queries using joins and aggregate functions

- Bachelor's Degree in Business, Marketing, Engineering, Communications, or related field
- 5-10 years of experience in one or more of the following:
- software engineering and/or quality assurance
- Strong programming with Java/J2EE
- AWS experience
- Strong QA mindset curious, meticulous, willing to speak up
- Basic SQL skills

- An incoming candidate must have strong communication, technical, automation, and assurance skills.  They also must be able to assess risk and create tests independently following an established strategy. The candidate must have strong quality assurance practice knowledge and hands-on implementation of functional and performance testing.

- Must-Haves (please do not send candidates that do not meet these criteria):
   - Experience with cloud infrastructure and testing applications running on cloud technologies
   - Demonstrated knowledge of cloud components and architecture (preferably AWS and core services such as ECS, Lambda, S3, SQS, etc.)
   - Understanding and ability to describe application architectures
   - Hands-on experience and ability to develop UI and API automated tests in common frameworks (e.g., Rest Assured, Selenium, - Cucumber, etc.,)
   - Experience executing and implementing QA strategies that include all functional and nonfunctional quality assurance - considerations
   - Experience with object-oriented programming (Java preferred) and prior experience with application or automation framework - development
   - Experience implementing tests with modern automated testing tools (e.g., Cucumber, Playwright, Karate, etc.), frameworks, and patterns
   - Experience with foundational database concepts (Selecting, Filtering, Joining, Simple Aggregates like Sum and Count)
   - Ability to independently design and create test cases following a set strategy for software applications
   - Ability to create, execute, debug, and analyze automated load and performance tests
   - Ability to develop automated tests using mocks/stubs
   - Strong critical thinking and problem-solving skills
   - Demonstrable experience seeking out information and learning through self-research
   - Strong written and verbal communication skills
- Required Skills
   - Ability to effectively communicate progress on tasks
   - Prior experience estimating individual pieces of work
   - Ability to assess, communicate, and escalate risks when necessary
- Nice-to-Haves:
   - Foundational knowledge of artificial intelligence and machine learning
   - Foundational knowledge of application security testing
   - Hands-on DevOps skills (e.g. Jenkins)
   - Experience with Node and that family of languages (Javascript, Typescript)
   - Experience with application development tools and frameworks (Spring, Springboot, Angular, React, etc.)

## Skills
- Java
- AWS
- SQL
- QA mindset: 
  - (start with types of test:) 
    - unit, 
    - integration, 
    - smoke, 
    - regression, 
     - Regression testing (rarely, non-regression testing) is re-running functional and non-functional tests to ensure that previously developed and tested software still performs after a change. If not, that would be called a regression.
      - Changes that may require regression testing include bug fixes, software enhancements, configuration changes, and even substitution of electronic components. As regression test suites tend to grow with each found defect, test automation is frequently involved. Sometimes a change impact analysis is performed to determine an appropriate subset of tests (non-regression analysis). 
    - performance, 
    - security, 
    - scalability, 
    - reliability, 
    - failure tolerance, 
    - TDD, 
    - BDD, etc.
- then frameworks are used for automation test
- When testing:
  - what data used for testing
  - what shall be the output
  - conflicts between expectation and testing result
  - conflicts between developer and you as tester
  - you work as tester or as developer as well
  - how does that change your perspective
  - during the Q&A, those are the things you need to demo to the interviewer

- Junit
- TestNG
- Selenium

## Please describe our company
- Finra is the non-profit organization that regulates the stock market, so every single transaction that happens in stock market must, by law, be reported to over to Finra. Then, Finra reviews it using some algorithms to check for any anomalies or any suspicious activities in the market, and so on. 

## Question Lists 1
- self intro && previous project
- Given an API in java, how do you test it without seeing the source code?
  1. Understand the API Documentation
     - First, I would thoroughly read the API documentation to understand the endpoints, request parameters, response formats, and any specific requirements or constraints.
  2. Set Up the Testing Environment
     - I would set up a testing environment using tools like Postman for testing RESTful APIs. This tool allows me to make HTTP requests and validate responses.
  3. Write Test Cases
     - Using my experience with JUnit and TestNG, I would write automated tests for the API. These tests would cover different aspects like:
       - Unit Tests: Verify the individual components of the API.
       - Integration Tests: Ensure that different parts of  the API work together as expected.
       - Smoke Tests: Perform a basic check to see if the  API is up and running.
       - Regression Tests: Ensure that new changes do not break existing functionality.
       - Performance Tests: Measure the response time and throughput of the API.

     - Based on the API documentation, I would write test cases to cover different scenarios, including:
       - Positive Test Cases: To verify the API returns expected results for valid inputs.
       - Negative Test Cases: To check how the API handles invalid inputs or error conditions.
       - Edge Cases: To test the boundaries of the API's functionality.
       - Performance Test Cases: To ensure the API performs well under load.
  4. Use Selenium for UI Testing
     - If the API is integrated with a web application, I would use Selenium for end-to-end testing. Selenium can interact with the web application, trigger API calls, and verify that the UI updates correctly based on the API responses.
  5. Write SQL Queries to Validate Database Changes:
     - To verify the database state after API calls, I would write SQL queries using joins and aggregate functions. This ensures that the API correctly interacts with the database.
  6. Adopt TDD and BDD Approaches:
     - Using Test-Driven Development (TDD) and Behavior-Driven Development (BDD) approaches, I would write tests before implementing the API calls. This ensures that the API meets the required specifications.
  - By following these steps and utilizing my expertise in JUnit, TestNG, Selenium, and SQL, I can effectively test the API without needing to see the source code.

- After verification of this API in java, how do you ensure developers will use it correctly?
  - First of first is the documentation
    - I will provide detailed documentations that will cover all endpoints, request parameters, response formats, error codes, and example requests and responses.
    - then, I will add usage guide that will tell how to integrate and use API in a proper way including common use case and best practice.
    - Finally, I will offer some code samples in the documentation to illustrate how to interact with the API.
  - So that's the first step, the documentation
  - The Second step, I will create a Test Suit including integration test and mock server. With the usage of Junit and TestNG I can have a comprehensive integration test, and these tests can be shared with developers to ensure they have a working example of how to use the API correctly. And I should create a Mock Server, that mimics the behavior of the real API. Developer will use that to test without affecting the production environment.
  - The Third step, I will hold a workshop or a meeting to familiarize developers with the API including features, and best practice. It will also have QA sessions that developers can ask questions about API usage. I will also setup support channels like Slack, dedicated email support to assist developers if they have any confusion afterwards. 
  - The Fourth step, I should also setup monitoring and alerts. Tools like Prometheus and Grafana can be used for monitoring API usage.
  - In the final step, I will integrate API usage checks into the CI/CD pipelines. To automate tests.

- Why do you wanna be a SDET after being a developer in Apple?
  - By transitioning to an SDET role, I can leverage my development experience to enhance software quality, improve testing processes, and contribute to delivering exceptional products. 
  - This role aligns with my career aspirations and allows me to make a meaningful impact on the software development lifecycle.

- How do you feel about coding?
  - I am very passionate about coding. There is also a great sense of accomplishment in creating apps that can be used by others to make some difference in their life.
  - It's also a great job that aligns with my interests, strengths, and career goals.
  - So I am very very enjoying coding.

- Given an API with a number as input in which will check whether the number is prime number or not, how will you test it?
  - first, I will check the documentation first, to understanding which url to use, which http methods to use (in this case, it should be only get and post http methods), and also check request parameters (to see if it's in the request body or just query parameters), and also check the response format.
  - After checking all those descriptions and constraints in the documentation. I would do manual test with the Tools like Postman.
    - The test cases should cover
      - positive test case
      - negative test case
      - edge case
      - error case
  - Then I would write automated tests to ensure the API functions as expected.
  - I would also ensure the API can handle a high load. Tools like Jmeter can perform performance testing. By simulating high number of concurrent requests.
  - And I would perform security testing. for example the test for SQL injection, command injection, and other injection vulnerabilities. and so on.
  - by covering these aspects, I can ensure the API functions correctly, performs well under load, and is secure.

- Let’s say I gave you a very very large number and you passed it into the API, the API said it is a prime. How do you know if this input is a prime or not?
  - There are several approaches to verify the answer that if the given number is prime or not.
    - First, we can use online tools to verify the given large number.
    - Second, we can use different programming language that support large number by default like python.
    - Third approach, we can verify the given number with the Prime number database.

- If developers in another team ask you to pick up the source code today so that you can test today to ensure release tomorrow, will you think it is reasonable?
  - It depends on several factors.
  - First, if the code changes are minor, such as bug-fix, small feature updates, and the code is well-documented, it might be feasible to test and release within a short timeframe. However, for significant code change or new features, that would definitely need more time to test thoroughly.
  - Second factors is existing test coverage. for example if the current test suite covers the code change, if so, it would save some time. If not, extensive testing is needed.
  - Third factor is risk assessment. If the code change is high-risk or critical, that will be need more time to test. Otherwise, we can have a rollback plan in case some issues are discovered in the production environment.
  - So with those constrains, it is possible to test and release the code within a short timeframe.

- What was the biggest challenge for you when you worked at Apple?
  - the biggest challenge I faced is that to improve the performance of our microservice as the user base and data volume rapidly increase.
  - right now, it's still a on-going task in current project. The approach we current use is to tuning the caching frequency and optimize database query, etc.

- Given an Oracle database, we are migrating into Postgres DB. In Oracle there is a table that contains 1 million records, and after migration, there are 1 million + 1 records in Postgres DB. Do you think it is good to go? What about there are 1 million records in Postgres DB? Do you think that is good to go?
  - 1 Million + 1 Records: This situation requires investigation to identify and understand the source of the extra record before proceeding. It’s not safe to go without resolving this discrepancy.
  - 1 Million Records: While this is more reassuring, thorough data integrity checks, schema validation, and application testing are still necessary to ensure a successful migration.
  - In both scenarios, it's essential to perform detailed validations and checks to ensure data consistency and integrity. Only after addressing any discrepancies and confirming the accuracy of the data should you consider the migration complete and the system ready to go live.

## Question Lists 2
- self intro && previous project
- override vs overload
- exception handle
- throws vs try catch finally
- what is finally
- how to handle runtime exception
- Where did you use reflection?
- what is IoC
- What is an actuator?
- how to enable actuator in spring boot
- how to have an immutable class in java?
- is immutable class thread safe
- why we don’t have all the class immutable
- what is factory design pattern
- sql: intersect vs union vs minus
- truncate vs delete vs drop
- code: pair programming with interviewer to regenerate a recent test case interviewee has written recently in project
- from 1 to 10, how much do you grade your javascript?
- what is prototype in javascript
- What is the difference between javascript vs java inheritance?
- How big is your team size?
- How many frontends? How many backends?
- Do you have a scrum master?
- What about other roles?
- Do you have a daily stand up meeting?
- What do you do in daily stand up meetings?
- CICD experience
- Have you used the S3 service in AWS in a previous project?
- json validation
- json mapping
- Last round someone jumps in and asks about a scenario: given a xxx.br2 file in which contains json objects. we wanna read the content in this file and validate the content via a **rule based design pattern(this is a solution the interviewer spoke out at the end). He wants a design on what are the classes you need, what are the flows you are going through. (Solution he gave contains a FileReader interface, an implementation on this interface, a Rule interface, implementation on this Rule interface)**

## Question List 3
- latest project
- AWS experience
- Junit 5 vs Junit 4
- how to connect API in test
- how do you do the Authentication
- how does JWT work
- downside JWT
- Java 8 new features
- method reference
- optional keyword
- sql aggregation function
- Jenkins
- Coding: Count the char frequency in a string
- Hibernate architecture
- JDBC
- lazy loading
- self join
- SQL Query: update one field of table
- SQL Query: find all the orders and customer name from the table
- when the user story is not clear, how do you do

## Question List 4
- Introduce yourself and project
- follow TDD to do all questions
- coding: isPalindrome(int number)
- coding: sql return emp info who has same salary as other emp
- coding: find first missing positive number
- given example : we need to get prices in last 15 min , formula is xx - price / xx > 50% ,
- if xx = 102.50
- cur time = 16:00
- what price will you test

## Question List 5
- Introduce yourself and project
- Do you have any frontend experiences?
- What are annotations you used a lot in your project?
- How your internal spring services connection with external services
- How do you interact with database
- What is jpa
- Multithreading in java
- How do you handle global exception
- If you have try and finally block without catch block, can you execute it
- What is springbootapplication annotation
- What is java reflection
- Where did you use reflection
- What are reasons you used reflection
- What are steps to make a immutable class
- What is left and right join
- What is functional interface
- How to implement functional interface
- What is lambda expression
- Coding: given a duplicated arraylist, remove all duplicate elements and return a list without duplicate elements.(cannot - create a new collection)
- Using stream api solve above question
- Find the middle element in arraylist without using size method in arraylist
Getting all even numbers in arraylist by using lambda expression

## Following up questions
- how long will this project last? a couple months or more than a year or in between?
- can you tell me about the team I will work with?
- can you describe a typical day or week in this role?
- what's the next steps in the interview process?
- Is there anything we haven't covered that you think is important for me to know about working here.