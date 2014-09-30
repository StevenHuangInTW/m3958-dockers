#!/bin/bash

docker run --privileged=true -d --name mysql5piwik -v /opt/dockerdata/mysql5piwik:/opt/runningdir m3958/mysql5
