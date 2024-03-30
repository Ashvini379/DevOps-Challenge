# Dockerfile

This file describes all the steps that are required to create one image and would usually be contained within the root directory of the source code repository for your application. This file contains set of instructions.

## Commands used in Dockerfile

FROM : We have to specify base image using which application image is built. Base image is an image from Docker registry. We can use image with tag which is registered in Docker Registry.

ENV : This instruction allows you to set shell variables that can be used during the build process to simplify the Dockerfile.

RUN : This instruction is used to to start and create the required file structure that you need, and install some required software dependencies.

ADD : This instruction is used to copy files from the local filesystem into your image. Most often this will include your application code and any required support files.

WORKDIR : change the working directory in the image for the remaining build instructions.

CMD : It defines the command that launches the process that you want to run within the container.

MAINTAINER  : It provides contact information for the Dockerfile’s author, which populates the Author field in all resulting images’ metadata.

COPY : Copies files from the host machine to the image.

EXPOSE : It defines port that should be exposed on the container.

## Use-Case 

Deploying Docker Container using Base Python3 Linux Image

The key objectives of this project are:

Build a Docker image using a base Python 3 Linux image from Docker Hub (http://hub.docker.com)

Configure the Docker image to include your Python web application and its dependencies.

Successfully run a Docker container based on the created image.

Gain hands-on experience with Docker and containerization concepts.
