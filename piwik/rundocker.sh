#!/bin/bash

docker run -d --name piwik -v /opt/dockerdata/piwikx:/opt/runningdir -v /opt/dockerdata/piwik/nginx.conf:/etc/nginx/nginx.conf m3958/piwikx
