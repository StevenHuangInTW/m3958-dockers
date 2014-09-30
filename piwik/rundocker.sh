#!/bin/bash

docker run -d --name piwik -v /opt/dockerdata/piwikx:/opt/runningdir m3958/piwikx
