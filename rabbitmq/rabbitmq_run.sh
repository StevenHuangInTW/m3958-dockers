#!/bin/bash

trap "{ echo Stopping rabbitmq; rabbitmqctl stop; exit 0; }" EXIT
rdr=/opt/runningdir/rabbitmq

duser=$(stat -c %U "$rdr")

if [ ! $duser = "rabbitmq" ]
then
  chown -R rabbitmq:rabbitmq $rdr
fi

/usr/sbin/rabbitmq-plugins enable rabbitmq_management

echo "start rabbitmq..."
exec /usr/sbin/rabbitmq-server
echo "start rabbitmq done"

#rabbitmqctl add_user guest guest
#rabbitmqctl delete_user guest
#rabbitmqctl set_user_tags guest administrator  management policymaker monitoring

#"guest" user can only connect via localhost,
#change [{rabbit, [{loopback_users, []}]}]. will enable it.
#we can run debugrun.sh,then change the user and password
