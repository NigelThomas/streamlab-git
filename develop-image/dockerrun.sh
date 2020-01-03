#!/bin/bash

# Example of how to start a container using the streamlab-git-dev image and referencing a git repository
#
# set LOAD_SLAB_FILES e/v as a space separated list of slab files (if not set, all will be loaded)

BASE_IMAGE=streamlab-git-dev
GIT_ACCOUNT=https://github.com/NigelThomas
GIT_PROJECT_NAME=sqlstream-orctest
CONTAINER_NAME=orcdev

docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker run -p 80:80 -p 5560:5560 -p 5580:5580 -p 5585:5585 -p 5590:5590 -p 5595:5595 \
            -e GIT_ACCOUNT=$GIT_ACCOUNT -e GIT_PROJECT_NAME=$GIT_PROJECT_NAME -e LOAD_SLAB_FILES="${LOAD_SLAB_FILES}" \
            -d --name $CONTAINER_NAME -it $BASE_IMAGE
