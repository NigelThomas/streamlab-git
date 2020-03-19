#!/bin/bash

# Example of how to start a container using the streamlab-git-dev image and referencing a git repository
#
# GIT_ACCOUNT : the base URL for the remote git repo 
# GIT_PROJECT_NAME : the namer of the git repo
# CONTAINER_NAME : the name of the container as it is running
# LOAD_SLAB_FILES : a space separated list of slab files (if not set, all will be loaded)

# SQLSTREAM_HEAP_MEMORY : a value for the -Xmx parameter for s-Server (max heap space) default is 2048m
# SQLSTREAM_DISABLE_PUMPS: set to non-blank to prevent pumps being started
# SQLSTREAM_SLEEP_SECS: additional seconds to wait after s-Server started


: ${BASE_IMAGE:=sqlstream/streamlab-git-complete}
: ${GIT_ACCOUNT:=https://github.com/NigelThomas}
: ${GIT_PROJECT_NAME:=sqlstream-orctest}
: ${CONTAINER_NAME:=orcdev}

docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker pull $BASE_IMAGE
docker run -p 80:80 -p 5560:5560 -p 5580:5580 -p 5585:5585 -p 5590:5590 -p 5595:5595 \
            -e GIT_ACCOUNT=$GIT_ACCOUNT -e GIT_PROJECT_NAME=$GIT_PROJECT_NAME -e LOAD_SLAB_FILES="${LOAD_SLAB_FILES}"  \
            -e SQLSTREAM_HEAP_MEMORY="${SQLSTREAM_HEAP_MEMORY}" -e SQLSTREAM_DISABLE_PUMPS="$SQLSTREAM_DISABLE_PUMPS" -e SQLSTREAM_SLEEP_SECS=${SQLSTREAM_SLEEP_SECS} \
            -d --name $CONTAINER_NAME -it $BASE_IMAGE
