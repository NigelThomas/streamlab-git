#!/bin/bash
#
# Fetch a StreamLab project or multi-project from a git repository and install to s-Server

cd /home/sqlstream

# the environment variables define which project gets loaded
git clone ${GIT_ACCOUNT}/${GIT_PROJECT}.git

cd ${GIT_PROJECT}

# the startup script orchestrates loading and running the project
./startup.sh

