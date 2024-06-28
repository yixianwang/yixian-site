+++
title = 'Interview Questions'
date = 2024-06-20T22:49:47-04:00
+++

## Questions
### Important
- Introduce your self and the previous project in 2 to 3 minutes.
  - Hi, thanks for having me today. My name is Austin Wang. I a professional Java developer with over 6 years experience.
  - Within my past working experience, all the projects I have are Web-Application.
  - So I am very proficient in back-end programming with Java and Spring Framework.
  - and also many other web technologies.
  - like database including the relational and non-relational ones.
  - the messaging queue systems like Kafka
  - the ORM(Object-relational mapping) frameworks including hibernate and Spring Data JPA, and so on.
  - I also have experience in developing front-end using Angular.
  - I am an AWS-certified solution architect with real hands-on experience.
  - The most recent project I am currently working on is called Data Analytics Dashboard System at Shopify company. This project is only designed for internal users only. They will use this system provide analytics and some comprehensive insights to various departments like sales department, customer support department, and so on. The Data Analytics Dashboard System also supports Role based access control for different users.
  - With those knowledge and experience I can work on any complex and sophisticated project for the company.
  - Thank you! 

- Describe a specific function/feature you did in last project. As detailed as possible.
  - The most recent project is called Data Analytics Dashboard at eBay. There is a Feature I worked on is called **Real-Time User Activity** Dashboard.
  - This feature is designed to provide insights into user activity on the platform. 
  - It helps them understand user behavior, identify trends, and make data-driven decisions.
  - Details:
    1. Gather Requirements:
       - I collaborated with BA to collect specific needs and the kind of metrics they wanted to track, and how they wanna define the metrics.
       - Key Metrics: We identified key metrics such as user login frequency, page views, search queries, purchase behavior, and real-time user location data.
       - For example, the metric to define new users including two parts: the brand new user should be categorize new users for sure, and also some old users that haven't use eBay more than 1 year we count these users as new users as well. And so on so forth, all those kind of metrics.
    2. Design Phase:
       - I designed a microservice architecture using Spring Boot for the backend services, Kafka for real-time data streaming, and Redis for caching frequently accessed data.
       - Data Flow: The data flow involved collecting raw user activity data, processing it in real-time, and storing it in a format suitable for quick retrieval and visualization.
    3. Implementation:
       - Data Collection Service:
         - Developed a Spring Boot service to collect raw user activity data from various sources (e.g., web logs, API calls).
         - Integrated Kafka producers to publish this raw data to different Kafka topics based on activity types.
       - Data Processing Service:
         - Created Kafka consumers using Spring Kafka to read the data from Kafka topics.
         - Implemented data transformation and enrichment logic to normalize and augment the data with additional information (e.g., user demographics, geolocation).
         - Used Redis to cache frequently accessed metrics and intermediate results to reduce latency.
       - Data Storage:
         - Stored the processed data in PostgreSQL for relational queries and historical analysis.
         - Utilized MongoDB to store unstructured data and support flexible querying for real-time dashboards.
    4. API Development:
         - RESTful APIs: Developed RESTful APIs using Spring Boot to expose the processed data to the frontend application.
         - Endpoints: Created endpoints for fetching aggregated metrics, detailed activity logs, and real-time updates.
         - Documentation: Documented the APIs using Swagger to ensure clarity and ease of use for frontend developers.

- How did you agile in your team? Typical Day?
  - We follow the Agile Scrum framework, conducting regular meetings such as daily stand-ups, spring planning, sprint reviews, and retrospectives. With these practices ensured continuous improvement and allowed us to quickly adapt to any change on the business requirement.
  - For each of typical day, the scrum master will hold a stand-up meeting in the morning about 15 minutes to discuss what we have done yesterday and what we should do in the current day. Get task from Jira System, and work on it then update the Jira system.
     - Just Coding.
     - Following Standard.
     - Bring new ideas.
     - Learn and self improve.
 
- What is the size of team? BA, DBA, QA, TL(team lead)?
  - Our team has 25 members. 
     - 1 Product Manager + Scrum Master
     - 1 BA
     - 1 Project Manger + BE TL
     - BE 1 TL + 7 Dev
     - FE 1 TL + 5 Dev
     - QA 1 TL + 4 QA
     - DBA 2 DBA
     - DevOps 2 DevOps
  - One Business Analyst who gathers requirements from stakeholders and ensures they are clearly communicated to the team.
  - Two Database Administrator who manages the database system.
  - Five Quality Assurance Engineers who are responsible for testing.
  - One Team Lead conducts code review, provides technical guidance, mentors team members, and coordinates with other teams.
  - The core of our team has 7 Developers who write and maintain the code, implement new features, and fix bugs.

- Most challenging/proud task.

- What is the Deployment process? How do you release? How many environment do you have?
   - Environments:
      - Development Environment:
         - Purpose: Used by developers to build and test new features and bug fixes.
         - Tools: Local development environments, Docker containers, and possibly a shared development server.
      - Staging Environment:
         - Purpose: Acts as a pre-production environment to test the integration of new features and ensure they work correctly before going live. It mirrors the production environment closely.
         - Tools: AWS EC2 instances, Kubernetes (EKS), RDS, etc.
      - Production Environment:
         - Purpose: The live environment where the application is available to internal users.
         - Tools: AWS EC2 instances, RDS, ElastiCache, MSK, CloudFront, etc.
   - Deployment Process:
      1. Code Commit and Version Control:
         - Git: Developers commit their code changes to a shared repository using Git.
         - Branching Strategy: Utilize a branching strategy like Gitflow to manage feature development, releases, and hotfixes.
      2. Continuous Integration (CI):
         - Jenkins Pipeline:
            - Triggers: The CI pipeline is triggered automatically upon code commit or pull request.
            - Steps:
               - Build: Compile the code and resolve dependencies.
               - Unit Tests: Run unit tests using JUnit to ensure code quality and functionality.
               - Static Code Analysis: Use SonarQube to analyze code quality and identify potential issues.
      3. Artifact Storage:
         - Docker Hub/Amazon ECR: Build Docker images and store them in a container registry like Docker Hub or Amazon Elastic Container Registry (ECR).
      4. Continuous Deployment (CD):
         - Jenkins/CD Pipeline:
            - Triggers: The CD pipeline is triggered upon successful completion of the CI pipeline.
            - Steps:
               - Deploy to Development:
                  - Docker Compose: Use Docker Compose to deploy the application in the development environment.
                  - Automated Tests: Run integration tests and functional tests.
               - Deploy to Staging:
                  - Kubernetes: Use Helm charts to deploy Docker containers to the Kubernetes cluster in the staging environment.
                  - Manual Testing: Perform manual testing and user acceptance testing (UAT).
                  - Load Testing: Conduct load and performance testing.
               - Approval Process: Obtain approval from QA and stakeholders before deploying to production.
      5. Release to Production:
         - Blue-Green Deployment/Canary Release:
            - Blue-Green Deployment: Deploy the new version of the application in parallel with the old version, then switch traffic to the new version once it's verified to be stable.
            - Canary Release: Gradually roll out the new version to a small subset of users before fully deploying it.
         - Kubernetes: Use Helm charts to deploy Docker containers to the Kubernetes cluster in the production environment.
         - Post-Deployment Monitoring: Monitor application performance and logs using AWS CloudWatch and Prometheus to ensure the new release is functioning as expected.
      6. Rollback Strategy:
         - Automated Rollback: Implement automated rollback mechanisms in the Jenkins pipeline to revert to the previous stable version in case of issues.
         - Manual Rollback: Have procedures in place for manual rollback if automated rollback is not feasible.

- Do you have front-end experience?
  - Yes, I do have front-end experience. With small part of time I would do DOM manipulation with vanilla Javascript or with jQuery. Most of time I just use Angular framework. Over the course of my career, I have worked on various projects where I was responsible for designing and implementing user interfaces that are not only visually appealing but also highly functional and responsive. 

- Do you know Cloud/AWS? Where/what do you use?
  - I am AWS certified solution architect. 
  - I also have hands-on experience in AWS provisioning for my previous projects including EC2, S3, RDS, SNS, SQS, etc.
  - For example, in my the most recent project at eBay which is Data Analytics Dashboard. 
    - I use EC2 to host microservices I built. 
    - I also use Amazon RDS to host PostgreSQL database. 
    - And MSK(Managed Kafka) service for real-time data streaming. And so on.
      - Set up VPCs to create isolated network environments, configured subnets, route tables, and NAT gateways.
      - Used S3 for storing and retrieving large datasets, including log files and user-generated content. Configured bucket policies and lifecycle rules for data management.
      - Configured CloudWatch for monitoring application performance, setting up alarms, and logging. Integrated CloudWatch with Prometheus for enhanced monitoring.

### Normal
- What's your strong/weak point?
  - Strong point: I am very strict with my time management. For instance, I like to set reasonable deadline for each task. The deadline I set can give me a sense of urgency. And I believe that a sense of urgency makes me more efficient.
  - Week point: I will get nervous if I have to give a speak in a big meeting or conference in front of a lot of people.
- Version control. How did you use it? SVN? GIT? Branching, CheckIn-CheckOut.
   - In my projects, I've primarily used Git for version control. Our team followed a branching strategy similar to Gitflow. We had separate branches for feature development, bug fixes, and releases. Typically, we would:
      - Branching: Create feature branches from the develop branch.
      - CheckIn-CheckOut: Regularly commit changes locally and push them to the remote repository. We also performed code reviews using pull requests before merging changes back into the develop branch.
      - Merging: Once features were tested, they were merged into the develop branch, and periodically we would merge develop into main for a release.
      - SVN Experience: Although I primarily used Git, I have experience with SVN from earlier projects where we used a centralized approach to version control, focusing on check-in/check-out mechanisms and resolving conflicts during updates.
- Did you do production support.
   - Yes, I have been involved in production support. My responsibilities included monitoring application performance, handling incidents, debugging production issues, and ensuring high availability. We used tools like AWS CloudWatch and Prometheus for monitoring and alerting, and I was part of the on-call rotation to address critical issues promptly.
- What will you do if you don't like the design from other team member? Conflict? Which project is your favorite?
   - If I don't agree with a design from a team member, I would:
      - Discuss: Arrange a meeting to discuss the design and understand the reasoning behind their choices.
      - Collaborate: Provide constructive feedback and suggest alternatives while keeping an open mind.
      - Consensus: Aim to reach a consensus that benefits the project as a whole. If needed, involve a neutral third party, like a team lead or architect, to mediate.
      - Favorite Project: My favorite project was the Real-Time User Activity Dashboard at eBay. It was complex, involved cutting-edge technology, and had a significant impact on the business.
- How did you use spring mvc/ws/hibernate/transaction/all technologies in your resume in detail with examples of your project
   - Spring MVC: Used for building RESTful APIs to serve the real-time analytics data to the frontend.
   - Spring WS: Developed SOAP-based web services for internal communication between legacy systems and new microservices.
   - Hibernate: Utilized for ORM to map Java objects to database tables and manage CRUD operations efficiently.
   - Transactions: Managed transactions using Spring's @Transactional annotation to ensure data integrity during complex operations.
   - Example: "In the eBay project, I used Spring MVC to create endpoints for the analytics dashboard. Spring WS facilitated integration with legacy systems, enabling seamless data exchange. Hibernate managed data persistence in PostgreSQL, and Spring’s transaction management ensured data consistency during multi-step operations, like processing and updating user activity logs.
- How many tables you worked on, how much traffic, how many users/clients
   - In the eBay Real-Time User Activity Dashboard project:
      - Tables: Worked on around 50 tables, including complex joins and indexing strategies for performance.
      - Traffic: Handled data streams of several thousand events per second using Kafka.
      - Users: Supported hundreds of internal users, including analysts and executives, who accessed the dashboard for insights.
- How did you use JIRA/jenkins?
   - JIRA: Used for task management, sprint planning, and tracking progress. Created user stories, logged bugs, and followed Agile methodologies.
   - Jenkins: Set up CI/CD pipelines to automate builds, run tests, and deploy applications. Configured jobs for different environments and integrated with GitHub for automatic triggers on code commits.
- Do you write document? What kind of document? Swagger?
   - Yes, I write various types of documentation:
      - API Documentation: Used Swagger to document RESTful APIs, making it easy for frontend developers to understand and consume the services.
      - Technical Documentation: Detailed system architecture, data flow diagrams, and design decisions.
      - User Guides: Instructions for internal users on how to use the analytics dashboard.
- What's the name of your manager/team lead/architect?
   - My project manager was [Josh Lee]. The Backend team lead is [Agrima Jindal], she also worked as an architect.
- Where is the project located?
   - The project was developed and deployed within eBay's internal infrastructure, hosted on AWS cloud services. Our development team was based in [Location, e.g., San Jose, California].
- How did you do unit testing?
   - I used JUnit for writing unit tests. Each method was tested independently, ensuring they performed as expected. Mocking frameworks like Mockito were used to simulate dependencies. We aimed for high code coverage to catch potential bugs early.
- How do you handle exception? How do you log? Any tools used?
   - Exception Handling: Implemented centralized exception handling using Spring's @ControllerAdvice and @ExceptionHandler. Custom exceptions were created for specific error scenarios.
   - Logging: Used SLF4J with Logback for logging. Logs were structured and included context to aid debugging. Tools like ELK Stack (Elasticsearch, Logstash, Kibana) were used for log aggregation and visualization.
- Do you know any scripting language? Where do you use scripting?
   - Yes, I am proficient in Python and Bash scripting. I used:
      - Python: For data analysis, automation tasks, and creating custom scripts for data processing.
      - Bash: For writing deployment scripts, automating server setup, and managing cron jobs.
- Given a task/story, what's the steps you take to complete it? What if there are road-blockers?
   - Understanding: Thoroughly read the task/story and clarify any ambiguities with stakeholders.
   - Planning: Break down the task into smaller, manageable sub-tasks.
   - Execution: Start with development, write tests, and commit changes.
   - Testing: Run unit and integration tests to ensure functionality.
   - Review: Submit the code for peer review and make necessary adjustments.
   - Road-blockers: Identify the issue, research possible solutions, seek help from team members or stakeholders, and escalate to the team lead if necessary."
- What will you do if you cannot finish a task on time?
   - If I cannot finish a task on time, I would:
      - Communicate: Inform my team lead and stakeholders about the delay as soon as possible.
      - Assess: Analyze the reasons for the delay and identify any blockers.
      - Plan: Create a revised plan with a new timeline and any additional resources needed.
      - Prioritize: Focus on critical aspects and defer non-essential parts if necessary."
- What's your next 5 years plan?
   - In the next 5 years, I aim to:
      - Skill Development: Continue enhancing my technical skills, particularly in cloud computing and AI/ML.
      - Leadership: Transition into a technical leadership role where I can mentor junior developers and lead larger projects.
      - Innovation: Contribute to innovative projects that drive business value and leverage emerging technologies."
- What do you know about our company? Do some research before go to a client interview.
- Why are you looking for a new project?
   - I seek new challenges and opportunities to grow my skills in different domains.
   - I also want to work on projects that have a significant impact and align with my passion for technology and innovation.
   - I am also eager to collaborate with new teams and bring fresh perspectives to complex problems.

## Questions to ask at the end of an interview
- At least 3 - 5 questions for the interviewer.
### 3 types of questions
1. Culture
   - What do you love most about your job?
   - What makes people stay with this organization?
   - What are the biggest challenges or opportunities that this organization or department is facing in the next six months to a year?
   - **What is your favorite part about working here in this organization?**
   - **How would you describe the work environment here?**
2. Role-specific
   - Can you tell me what a typical day or week looks like in this position?
   - What do you want the person in this position to accomplish in their first 30/60/90 days?
   - What challenges or opportunities do you foresee this position taking on in the next six month?
   - **How will my performance be measured in this position?**
   - **How long will this project last?**
   - **What are the next steps in the interview process?**
3. Hesitation
   - Do you have any hesitation about me filling this position?
   - Based on what we've talked about today, is there anything that is causing you hesitation about my fit for this position
   - How do I compare to other candidates you've interviewed for this role?
   - Have I answered all the questions that you have for me?
   - **Do you have any hesitation about my qualifications?**
   - **Is there anything I can clarify for you?**

## Tips before interview
- Prepare your phone/monitor/laptop at least 10 mins before. Double check if it is a dial-in call or they call you on your phone or skype.
- Dress code: dress as professional as you can.
- **DO research on the client company.**
- Keep checking your hangout/email.
- **Always ask questions at the end of the interview.**
- Take it seriously and be confident
- Always Turn on the camera. Make the background clean.
- You don't need to answer all the questions correctly to get the job.

