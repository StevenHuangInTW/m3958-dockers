#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/piwik:/opt/runningdir -v /opt/dockerdata/piwik/nginx.conf:/etc/nginx/nginx.conf m3958/piwik /bin/bash


#when first debugrun copy /piwik to /opt/runningdir
#copy php-fmp.conf php.ini
#copy all /etc/nginx
