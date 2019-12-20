# streamlab-git
This repository contains Dockerfiles to create standard Docker images (based on one of the standard Guavus SQLstream docker images) which, when they run,
will pull a git repository (for example from bitbucket.com or github.com), unpack any StreamLab project export files (slab
files) and set up the SQLstream s-Server catalog accordingly.

There are two scenarios:

1. `develop-image`: the `streamlab-git-dev` image (derived from `sqlstream/complete:release`) includes the StreamLab development environment. When the image is started all StreamLab projects are extracted from the
project repository and imported into the local StreamLab / Rose environment. The developer will be able to open the projects, work on them, and finally save them by exporting them 
to his desktop and adding the changes to the git repository.

2. `production-image`: the `streamlab-git` image is derived from `sqlstream/minimal:release` and does NOT include the StreamLab development environment. When the image is started the StreamLab project files are processed to create the required SQL and
dashboards included in the StreamLab projects are extracted from the StreamLab project exports and made available for s-Dashboard.

Any requirement for per-project customization is intended to be accomplished by adding a few smalli scripts that live in the remote
application repository and are triggered at key points in the container startup process (if present).

A very simple example of an application project would be the `streamlab-buses` repository in this account 

```
git clone https://github.com/NigelThomas/streamlab-buses.git
```

See https://docs.sqlstream.com/installing-sqlstream/docker/ for more information about the standard Guavus / SQLstream 
docker images.
