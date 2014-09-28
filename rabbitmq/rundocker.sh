#!/bin/bash

docker run --rm -it -p 5672:5672 -p 15672:15672 -v /opt/dockerdata/rabbitmq/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq
