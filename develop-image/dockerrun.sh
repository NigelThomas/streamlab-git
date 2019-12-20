#!/bin/bash

# Example of how to start a container using the streamlab-git-dev image and referencing a git repository

BASE_IMAGE=streamlab-git-dev
GIT_ACCOUNT=https://github.com/NigelThomas
GIT_PROJECT_NAME=streamlab-buses
CONTAINER_NAME=buses

docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker run -p 80:80 -p 5560:5560 -p 5580:5580 -p 5595:5595 -e GIT_ACCOUNT=$GIT_ACCOUNT -e GIT_PROJECT_NAME=$GIT_PROJECT_NAME -d --name $CONTAINER_NAME -it $BASE_IMAGE
