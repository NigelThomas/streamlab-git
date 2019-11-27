# Dockerfile

# Base the image on standard SQLstream image
# This project needs the PostgreSQL database and pre-loaded test data included with the complete image
FROM sqlstream/complete:release
MAINTAINER nigel.thomas@guavus.com

# Use jq to manipulate JSON files such as the slab file
RUN apt-get update &&\
    apt-get install -y jq

# This environment variable can be set when building the image
ENV GIT_PROJECT_NAME=undefined
ENV GIT_ACCOUNT=undefined

# copy the setup and startup and other scripts from the Dockerfile directory
COPY --chown=sqlstream:sqlstream *.sh /home/sqlstream/

# make the setup executable
RUN chmod +x /home/sqlstream/*.sh 

# the base image already EXPOSEs required ports - add EXPOSE here if you need to change, extend or reduce the list
EXPOSE 80 5560 5580 5595

# when the container starts, we want to start the project pumps and then tail the s-Server trace log
ENTRYPOINT GIT_PROJECT_NAME=${GIT_PROJECT_NAME} GIT_ACCOUNT=${GIT_ACCOUNT} /home/sqlstream/fetch_and_start_project.sh

