#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq /bin/bash
