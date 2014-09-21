#!/bin/bash

docker run --rm -it -v /opt/dockerdata/mysql5:/opt/mysql5 m3958/mysql5.1.73 /bin/bash

#--privileged=true
