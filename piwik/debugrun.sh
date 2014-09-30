#!/bin/bash

docker run --rm -it -v /opt/dockerdata/piwik:/opt/runningdir -v /opt/dockerdata/piwik/nginx.conf:/etc/nginx/nginx.conf m3958/piwik /bin/bash

#when first debugrun copy /piwik to /opt/runningdir
