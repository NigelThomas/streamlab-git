# Dockerfile

# Base the image on standard SQLstream image
FROM sqlstream/development:release
MAINTAINER nigel.thomas@guavus.com

# Use jq to manipulate JSON files such as the slab file
RUN  \
    apt-get update &&\
    apt-get install -y jq git &&\
    rm -rf /var/lib/apt/lists/*


# This environment variable can be set when building the image
ENV GIT_PROJECT_NAME=undefined
ENV GIT_ACCOUNT=undefined
ENV LOAD_SLAB_FILES=
ENV SQLSTREAM_HEAP_MEMORY=

# copy the setup and startup and other scripts from the Dockerfile directory
COPY --chown=sqlstream:sqlstream *.sh /tmp/

# get standard utilities - these can be overridden in the PATH

WORKDIR /home/sqlstream 

RUN mkdir -p /home/sqlstream/bin &&\
    cp /tmp/*.sh /home/sqlstream/bin &&\
    chmod +x /home/sqlstream/bin/*.sh &&\
    chown -R sqlstream:sqlstream /home/sqlstream

# the base image already EXPOSEs required ports - add EXPOSE here if you need to change, extend or reduce the list
EXPOSE 80 5560 5580 5585 5590 5595

# when the container starts, we want to load the latest versions of the StreamLan projects, start the project pumps and then tail the s-Server trace log
# we late bind to sqlstream-docker-utils as well as to the target StreamLab project

ENTRYPOINT export PATH=/home/sqlstream/bin:/home/sqlstream/${GIT_PROJECT_NAME}:/home/sqlstream/sqlstream-docker-utils:$PATH:$SQLSTREAM_HOME/bin &&\
           git clone https://github.com/NigelThomas/sqlstream-docker-utils.git &&\ 
           GIT_PROJECT_NAME=${GIT_PROJECT_NAME} GIT_ACCOUNT=${GIT_ACCOUNT} LOAD_SLAB_FILES="${LOAD_SLAB_FILES}" SQLSTREAM_HEAP_MEMORY="${SQLSTREAM_HEAP_MEMORY}" load_streamlab_projects.sh 

