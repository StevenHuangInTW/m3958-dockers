#/bin/bash

tdir=/opt/dockerdata/rabbitmq

if [ ! -d $tdir ]; then
  mkdir -p $tdir

  cp rabbitmq.config $tdir

  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
