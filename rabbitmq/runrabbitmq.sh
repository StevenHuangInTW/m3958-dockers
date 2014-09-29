#!/bin/bash

trap "{ echo Stopping rabbitmq; rabbitmqctl stop; exit 0; }" EXIT

duser=$(stat -c %U /opt/runningdir)

if [ ! $duser = "rabbitmq" ]
then
  chown -R rabbitmq:rabbitmq /opt/runningdir
fi

echo "start rabbitmq..."
exec /usr/sbin/rabbitmq-server
echo "start rabbitmq done"
