#!/bin/bash

docker run -p 127.0.0.1:222:22 -p -p 27017:27017 -d --name vertx -v /opt/dockerdata/anonymousupload:/opt/runningdir m3958/anonymousupload

#--privileged=true
