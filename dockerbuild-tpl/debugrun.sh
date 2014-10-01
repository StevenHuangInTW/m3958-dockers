#!/bin/bash

docker run --rm -it -v /opt/dockerdata/xxxx:/opt/runningdir \
    -v /root/m3958-dockers:/m3958-dockers m3958/xxxx /bin/bash
