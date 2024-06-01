#Create a freestyle project for building and running multiple containers
We will create a freestyle project for building and running multiple containers.

The docker-compose file defines two services: a django web application and a database. The web application is the same as we used in docker-compose task. The database is a PostgreSQL server that stores some data for the web application.

The source code for the web application and the database is available on GitHub:

https://github.com/Ashvini379/DevOps-Challenge.git

Folder: Day 013. Managing Multiple Containers With Docker-Compose

The docker-compose file for the application and the database is:
```
COPY

COPY
version: '3.3'

services:
  app:
    build:
      context: ./src
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    depends_on:
      - db
  db:
    image: "postgres:13.5-alpine"
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
```
To create a freestyle project for this task, follow these steps:

1. Go to your Jenkins dashboard and click on New Item.

2. Enter a name for your project and select Freestyle project. Then click OK.

3. On the configuration page, you can add some description for your project if you want.

4. Under Source Code Management, select Git and enter the repository URL: https://github.com/Ashvini379/DevOps-Challenge.git. You can leave the other fields as default.

5. Under Build, click on Add build step and select Execute shell (or Execute Windows batch command if you are using Windows). This will allow you to run any shell or batch command as part of your project.

6. In the text area that appears, enter below commands to start the multiple containers defined in the docker-compose file using Docker. The -d flag runs the containers in detached mode.

```
cd 'Day 013. Managing Multiple Containers With Docker-Compose/docker-django-webapp'
docker-compose up -d
```
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/9127968d-5cbc-43c0-a527-d9bb0bb9dc62)

7. Click Save to save your project.
Now, go back to your Jenkins dashboard and click on your project name. Then click on Build Now to run your project.

You will see a new build number appear under Build History with a blue ball indicating that the build is in progress. You can click on it to see the details of the build.

Click on Console Output to see the logs of the build. You should see something like this:
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/0c63902e-0295-4af8-8ce3-7d21582fc060)
