#!/bin/bash

docker run -p 80:80 -d --name varnish4 -v /opt/dockerdata/varnish4:/opt/runningdir m3958/varnish4
