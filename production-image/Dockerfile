# Dockerfile

# Can decide which tag to use
ARG BASE_IMAGE_LABEL=release

# Base the image on standard SQLstream image
FROM sqlstream/minimal:$BASE_IMAGE_LABEL

MAINTAINER nigel.thomas@guavus.com

# Use git to get project files
# Use jq to manipulate JSON files such as the slab file
# use nano for debugging
RUN apt-get update &&\
    apt-get install -y nano jq git &&\
    rm -rf /var/lib/apt/lists/*

# This environment variable can be set when building the image
ENV GIT_PROJECT_HASH=HEAD
ENV GIT_PROJECT_NAME=undefined
ENV GIT_ACCOUNT=undefined
ENV LOAD_SLAB_FILES=
ENV SQLSTREAM_HEAP_MEMORY=
ENV SQLSTREAM_DISABLE_PUMPS=
ENV SQLSTREAM_SLEEP_SECS=5

WORKDIR /home/sqlstream 

RUN chown -R sqlstream:sqlstream /home/sqlstream

# the base image already EXPOSEs required ports - add EXPOSE here if you need to change, extend or reduce the list
EXPOSE 80 5560 5580 5595

# when the container starts, we want to start the project pumps and then tail the s-Server trace log
# we late bind to sqlstream-docker-utils as well as to the target StreamLab project

ENTRYPOINT export PATH=/home/sqlstream/bin:/home/sqlstream/${GIT_PROJECT_NAME}:/home/sqlstream/sqlstream-docker-utils:$PATH:$SQLSTREAM_HOME/bin &&\
           git clone https://github.com/NigelThomas/sqlstream-docker-utils.git &&\ 
           GIT_PROJECT_HASH=$GIT_PROJECT_HASH GIT_PROJECT_NAME=${GIT_PROJECT_NAME} GIT_ACCOUNT=${GIT_ACCOUNT} \
            LOAD_SLAB_FILES="${LOAD_SLAB_FILES}" \
            SQLSTREAM_HEAP_MEMORY="${SQLSTREAM_HEAP_MEMORY}" SQLSTREAM_DISABLE_PUMPS="$SQLSTREAM_DISABLE_PUMPS" SQLSTREAM_SLEEP_SECS=${SQLSTREAM_SLEEP_SECS} \
            fetch_and_start_project.sh

