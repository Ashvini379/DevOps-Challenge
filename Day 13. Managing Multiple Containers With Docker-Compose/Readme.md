# Docker-Compose

Docker Compose is a tool for defining and running multi-container applications. Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

## How to Install?

You can install docker-compose as per steps given in below link

https://docs.docker.com/compose/install/linux/#install-the-plugin-manually

```
#update your Ubuntu server packages
sudo apt update
sudo apt upgrade

#download docker compose from the GitHub repository using the command 
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Run this command to make it executable
sudo chmod +x /usr/local/bin/docker-compose

#confirm installation
docker-compose -v
```

## What is YAML file?

YAML Ain't Markup Language (YAML) is a data serialization language that is consistently listed as one of the most popular programming languages. It's often used as a format for configuration files, but its object serialization abilities make it a viable replacement for languages like JSON.

The file starts with three dashes. These dashes indicate the start of a new YAML document.

YAML document is in a key-value pair format.

You can enclose strings in single(') or double-quotes(") or no quotes at all.

YAML recognizes unquoted numerals as integers or floating point.

Key with indentations and dashes is recognized as array.

Keywords used in Docker-Compose file

services : Services are containers. Immediately under the services keyword, the next level down will be the name of the containers.

build : When we create a container, we always have to specify an image. Comment If we are building the image from a Dockerfile, we can use the build keyword to specify the context for the Dockerfile.

image : If you are using an existing image that does not need to be built from a Dockerfile, you can specify the image name with the image keyword.

volumes : The volumes keyword can specify any volumes or bind mounts that will be associated with the service.

networks : You can use the networks keyword on a given service to connect it to specific networks.

environment : You can specify environment variables, like DATABASE_URL, SECRET_KEY, etc, using the environment keyword.

ports : You can use the ports keyword to publish mappings between internal and external ports.

depends_on : used to define services dependency

replicas : Used to make multiple copies of same containers.

## Docker-compose commands

docker-compose up: create all containers, networks and volumes described in our docker-compose file.

docker-compose up -d: same as above, but run containers in detached mode.

docker-compose -f up: create containers based on a different docker-compose file .

docker-compose down: remove all containers and networks.

docker-compose down -v: remove all containers, networks, and volumes

docker rm -vf $(docker ps -aq) : remove all containers

docker rmi -f $(docker images -aq) :  remove all images

## Use-Case

How to use docker-compose.yml file for multiple containers and how to create link between containers.

Deploying Python-Django docker-compose webapp.

Docker compose file is used to deploy multiple containers. This file will deploy 2 containers one for application and another for postgres database.

services

app : application image is built using dockerfile. It will run at port 8000 and it depends on db service.

db : This service will pull image from docker hub. It will run on port 5432 and it requires database username and password that are provided using environment variable.

```
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

First we will clone git repository using source code.

https://github.com/Ashvini379/DevOps-Challenge.git

```
#clone repository
git clone https://github.com/Ashvini379/DevOps-Challenge.git
#Naviate to project folder
cd /DevOps-Challenge/
cd 'Day 13. Managing Multiple Containers With Docker-Compose'
#Run docker-compose 
docker-compose up
```
