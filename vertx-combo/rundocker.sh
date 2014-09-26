#!/bin/bash

docker run --privileged=true -p 8093:8093 -d --name vertx -v /opt/dockerdata/vertxcombo:/opt/runningdir m3958/vertxcombo

#--privileged=true
