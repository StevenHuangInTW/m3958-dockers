#!/bin/bash

docker run --privileged=true -p 127.0.0.1:3306:3306 -d --name mysql5 -v /opt/dockerdata/mysql5:/opt/runningdir m3958/mysql5
