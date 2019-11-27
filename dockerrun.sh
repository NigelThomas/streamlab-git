#!/bin/bash

# Start the buses demo image
docker kill buses
docker rm buses
docker run -p 80:80 -p 5560:5560 -p 5580:5580 -p 5595:5595 -e GIT_ACCOUNT=https://github.com/NigelThomas -e GIT_PROJECT_NAME=streamlab-buses -d --name buses -it nigelclthomas/streamlab-git
