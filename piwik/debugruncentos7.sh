#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/piwik:/opt/runningdir m3958/piwik /bin/bash
