#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/varnish4:/opt/runningdir m3958/varnish4 /bin/bash

#--privileged=true
