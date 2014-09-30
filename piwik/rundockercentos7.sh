#!/bin/bash

docker run --privileged=true -d --name vertx -v /opt/dockerdata/piwik:/opt/runningdir -v /opt/dockerdata/piwik/nginx.conf:/etc/nginx/nginx.conf m3958/piwik
