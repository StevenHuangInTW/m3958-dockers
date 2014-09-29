#!/bin/bash

duser=$(stat -c %U /opt/runningdir)

if [ ! $duser = "rabbitmq" ]
then
  chown -R rabbitmq:rabbitmq /opt/runningdir
fi

exec /usr/sbin/rabbitmq-server
