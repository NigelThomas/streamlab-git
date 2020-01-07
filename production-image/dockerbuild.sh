#¡/bin/bash
docker build --pull=true -t sqlstream/streamlab-git .
docker push sqlstream/streamlab-git
