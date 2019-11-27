# streamlab-git
This repository creates a Docker image (based on one of the standard Guavus SQLstream docker images) which, when it runs 
will pull a git repository (for example from bitbucket.com or github.com), unpack any StreamLab project export files (slab
files) and set up the SQLstream s-Server catalog accordingly.

Dashboards included in the projects are extracted from the StreamLab project exports and made available for s-Dashboard.

Any requirement for per-project customization is intended to be accomplished by modifying scripts that live in the remote
application repository.

A very simple example of an application project would be the `streamlab-buses` repository in this account 

```
git clone https://github.com/NigelThomas/streamlab-buses.git
```

See https://docs.sqlstream.com/installing-sqlstream/docker/ for more information about the standard Guavus / SQLstream 
docker images.
