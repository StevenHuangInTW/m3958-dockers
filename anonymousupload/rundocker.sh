#!/bin/bash

docker run -p 8999:80 -d --name vertxanonymousupload -v /opt/dockerdata/anonymousupload:/opt/runningdir m3958/anonymousupload
