#!/bin/bash
docker build --pull=true -t sqlstream/streamlab-git-dev .
docker push sqlstream/streamlab-git-dev
