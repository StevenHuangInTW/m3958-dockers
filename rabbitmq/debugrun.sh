#!/bin/bash

docker run --rm -it --hostname=rabbitmqhostone -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq /bin/bash
