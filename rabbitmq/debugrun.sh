#!/bin/bash

docker run --rm -it -v /opt/dockerdata/rabbitmq/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq /bin/bash
