# What is DevOps?

DevOps is a culture which emphasizes collaboration and cooperation between Development and Operations teams. It is a part of the Agile methodology, focusing on breaking down silos between different departments of software development

DevOps involves Continuous integration (CI) and Continuous Deployment (CD) practices that automates resources and software delivery process which involves Infrastructure as Code (IaC), Development, Testing, and Deployment, monitoring, logging and Security. Cloud computing enables scalable and flexible infrastructure.

## DevOps Principles

Collaboration- DevOps fosters collaboration between development and operations teams. Agile process fixes collaboration between business people who gather requirements from customers and Development team who works on requirements. DevOps fixes collaboration between Development team and operations team who delivers in automated way.

Automation – DevOps involves maximizing automation throughout software development life cycle minimizing human errors, improving work and benefiting from shorter iteration times that enables faster customer feedback.

Continuous Improvement –It is a practice of focusing on minimizing waste and optimizing speed, cost and ease of delivery. It is also tied to continuous delivery allowing to improve efficiency of software systems and bring more customer value.

Customer centric action – It employ short feedback loop with customers and end users in iterative and customer centric manner. Teams swiftly collect and respond user feedback by leveraging real time monitoring and rapid deployment.

Create with end in mind - It cautions against isolated development, where the software is created based on assumptions about how consumers might use it. Instead, DevOps teams should adopt a comprehensive understanding of the product's entire lifecycle, from conception to implementation.

## How DevOps works?
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b0a25687-7b81-4a63-8d8a-f4e021774657)


DevOps breaks down the traditional silos between Development and Operations teams, fostering collaboration and shared responsibilities. Automation plays a crucial role in DevOps, replacing manual and slow processes with efficient and reliable automated workflows. DevOps teams utilize a technology stack and tooling that allows them to operate and evolve applications quickly and reliably.

Continuous Development – Developer write a code and push to Version Control system.

Continuous Integration -  It test the server and make all necessary integration

Continuous Deployment – it pushes code to Production server

Continuous Monitoring – If any bug found in testing server, feedback given to developer using monitoring and then developer fixes that bug.

## Benefits of DevOps

Faster and Continuous Delivery- DevOps promotes Continuous Integration and Continuous Delivery (CI/CD), enabling shorter development cycles and quicker time-to-market for new features and bug fixes.

Improved Collaboration and Communication - DevOps breaks down silos between Development, Operations, and other teams, fostering better communication and collaboration

Increased Efficiency and Productivity – Automation in DevOps reduces manual tasks and human errors, increasing overall efficiency and productivity

Higher Software Quality - Continuous testing and automated quality assurance in the CI/CD pipeline ensure that software is thoroughly tested throughout the development process

Stability and Reliability - DevOps practices emphasize monitoring and proactive measures to ensure system stability and reliability

Scalability and Flexibility - Infrastructure as Code (IaC) allows for easily scalable and flexible infrastructure, making it simpler to adapt to changing business needs and handle increased workloads.

Security Integration (DevSecOps) - By integrating security practices from the beginning of the development process, DevOps helps in identifying and resolving security issues early, reducing the risk of security breaches.

Rapid Feedback Loop - Continuous feedback and user insights enable rapid iteration and improvement of software, ensuring that customer needs and expectations are met effectively.

Cost Savings - Automation and streamlined processes lead to reduced development and deployment costs.

Cultural Transformation - DevOps promotes a culture of collaboration, shared ownership, and continuous learning. This cultural shift drives innovation and enhances employee satisfaction.

Alignment with Business Objectives - DevOps practices align software development with business objectives, allowing organizations to respond to market demands and customer feedback more effectively.

Increased Customer Satisfaction - Faster delivery of features, improved software quality, and prompt issue resolution result in higher customer satisfaction and loyalty.

## Process of DevOps
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/aaaed2fb-1891-45ac-9c26-e27cb305f70e)


Plan - During this phase, experts assess the commercial requirements and collect feedback from end-users. Subsequently, they formulate a project plan aimed at maximizing business benefits and achieving the desired outcomes.

Code - At this stage, the development team is actively coding the software. To streamline the design process, they utilize DevOps tools and extensions, such as Git, to prevent safety issues and ensure adherence to coding standards.

Build - At this stage, the development team is actively building the software once coding is done. To streamline the build process, they utilize DevOps tools and extensions, such as maven,ant or npm as per the application type and requirements.

Test - To ensure software's integrity, the product is initially sent to the testing platform for various types of screening. This includes user acceptability testing, safety testing, integration testing, speed testing, and more.Test automation tools like JUnit, Selenium, and others are utilized to carry out these tests effectively.

Release - At this stage, the build is ready for deployment in the operational environment. The DevOps team prepares updates or multiple versions to be released into production once the build successfully meets all the necessary checks aligned with the organizational requirements.

Deploy - At this point, Infrastructure-as-Code assists in creating the operational infrastructure and subsequently publishes the build using various DevOps lifecycle tools.

Operate - With tools such as Chef, the Management department take care of server configuration and deployment at this point. This version is now convenient for users to utilize.

Monitor - The DevOps workflow is observed at this level depending on data gathered from consumer behavior, application efficiency, and other sources.

## 7cs of DevOps Process

Continuous Development - Continuous Development is a vital aspect of DevOps, where code is written in small, continuous increments instead of all at once. This approach improves efficiency

Continuous Integration - Continuous Integration can be explained mainly in 4 stages in DevOps.

Getting the SourceCode from SCM

Building the code

Code quality review

Storing the build artifacts

Continuous Testing – Continuous testing can be implemented using agile approaches and automation testing tools like Selenium , LambdaTest etc.

Continuous Deployment - Involves automatic deployment of an application to the production environment after successful testing and build stages

**Continuous Delivery -**Entails manual deployment of an application to production servers after it has completed testing and build stages

Continuous Monitoring- This can be achieved using tools like Prometheus and Grafana. Prometheus gather various performance metrics , network traffics , error rates etc.

Grafana provides visual representation and tracking of series data.

Continuous Feedback - After the application is released, end users provide feedback on its performance and any glitches impacting their experience. The DevOps team analyzes this feedback and collaborates with developers to rectify the identified issues in the code.

Continuous Operations - Continuous operation will enable us to maintain higher application uptime, reducing maintenance downtime that could adversely affect end users.

Implementing DevOps in your organization

Implementing DevOps in an organization is a comprehensive and iterative process that involves cultural, procedural, and technological changes.

Here's a step-by-step guide to help you get started with DevOps implementation:

Assesment and Planning - Identify pain points, bottlenecks, and areas of improvement.

Cultural Transformation - Foster a blame-free culture that encourages learning from failures.

Promote shared responsibility for the entire application lifecycle.

Create a DevOps team - Establish a cross-functional DevOps team comprising members from Development, Operations, and Quality Assurance (QA).

Automate everything –Automate manual processes such as builds, Deployments  , testing  and monitoring.

Version control - Implement a robust version control system (e.g., Git) to manage code changes effectively.

Infrastructure as Code - Treat Infrastructure as Code by using tools like Terraform, Ansible, or CloudFormation to achieve consistency and scalability.

Monitoring and Logging - Set up comprehensive monitoring and logging to gain visibility into the application's performance and health using tools like Prometheus , Grafana , ELK stack

Security and Compliance - Integrate security checks into the CI/CD pipeline to identify and address vulnerabilities early in the development process.

Continuous learning and improvement - Conduct regular retrospectives to identify areas for improvement and implement necessary changes.

Knowledge sharing and Documentation - Document processes, best practices, and lessons learned to facilitate knowledge sharing across the organization.

Start small, iterate and Scale - Learn from the experience, iterate, and gradually scale the DevOps practices across the organization.

Executive support - Gain support from senior management and stakeholders to ensure adequate resources and commitment for the DevOps initiative.
