#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/mysql5:/opt/runningdir m3958/mysql5 /bin/bash

#--privileged=true
