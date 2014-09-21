#!/bin/bash

docker run --rm -it -v /opt/dockerdata/varnish4:/opt/varnish4 m3958/varnish4.0.1 /bin/bash

#--privileged=true
