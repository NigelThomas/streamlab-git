#¡/bin/bash
: ${BASE_IMAGE_LABEL:=latest}
export BASE_IMAGE_LABEL
docker build --pull=true --build-arg BASE_IMAGE_LABEL=$BASE_IMAGE_LABEL -t sqlstream/streamlab-git:$BASE_IMAGE_LABEL .
docker push sqlstream/streamlab-git:$BASE_IMAGE_LABEL
