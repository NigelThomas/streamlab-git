#!/bin/bash

# Example of how to start a container using the streamlab-git image and referencing a git repository

# GIT_ACCOUNT : the base URL for the remote git repo
# GIT_PROJECT_NAME : the namer of the git repo
# CONTAINER_NAME : the name of the container as it is running
# LOAD_SLAB_FILES : a space separated list of slab files (if not set, all will be loaded)
# SQLSTREAM_HEAP_MEMORY : a value for the -Xmx parameter for s-Server (max heap space) default is 2048m

: ${BASE_IMAGE:=sqlstream/streamlab-git}
: ${GIT_ACCOUNT:=https://github.com/NigelThomas}
: ${GIT_PROJECT_NAME:=sqlstream-orctest}
: ${CONTAINER_NAME:=orctest}


docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker pull $BASE_IMAGE

docker run -p 80:80 -p 5560:5560 -p 5580:5580 -p 5595:5595 \
           -e GIT_ACCOUNT=$GIT_ACCOUNT -e GIT_PROJECT_NAME=$GIT_PROJECT_NAME -e LOAD_SLAB_FILES="${LOAD_SLAB_FILES}" \
           -d --name $CONTAINER_NAME -it $BASE_IMAGE
