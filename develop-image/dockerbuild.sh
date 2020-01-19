#!/bin/bash
: ${BASE_IMAGE_LABEL:=release}
export BASE_IMAGE_LABEL
docker build --pull=true --build-arg BASE_IMAGE_LABEL=$BASE_IMAGE_LABEL -t sqlstream/streamlab-git-dev:$BASE_IMAGE_LABEL .
docker push sqlstream/streamlab-git-dev:${BASE_IMAGE_LABEL}
