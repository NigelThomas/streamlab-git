#!/bin/bash
: ${BASE_IMAGE_LABEL:=release}
export BASE_IMAGE_LABEL
#docker build --pull=true --build-arg BASE_IMAGE_LABEL=$BASE_IMAGE_LABEL -t sqlstream/streamlab-git-complete:$BASE_IMAGE_LABEL .
docker build --build-arg BASE_IMAGE_LABEL=$BASE_IMAGE_LABEL -t sqlstream/streamlab-git-complete:$BASE_IMAGE_LABEL .
docker push sqlstream/streamlab-git-complete:${BASE_IMAGE_LABEL}
