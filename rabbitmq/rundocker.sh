#!/bin/bash

docker run -p 5672:5672 -p 15672:15672 -d --name rabbitmq --hostname=rabbitmqhostone -v /opt/dockerdata/rabbitmq:/opt/runningdir m3958/rabbitmq
