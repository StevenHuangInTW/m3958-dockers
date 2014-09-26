#!/bin/bash

docker run --privileged=true -p 27017:27017 -d --name vertxanonymousupload -v /opt/dockerdata/anonymousupload:/opt/runningdir m3958/anonymousupload

#--privileged=true
