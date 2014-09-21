#!/bin/bash

docker run -p 127.0.0.1:222:22 -p 127.0.0.1:3306:3306 -d --name mysql5 -v /opt/dockerdata/mysql5:/opt/runningdir m3958/mysql5.1.73

#--privileged=true
