#!/bin/bash

docker run --privileged=true --rm -it -p 5672:5672 -p 15672:15672 -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq