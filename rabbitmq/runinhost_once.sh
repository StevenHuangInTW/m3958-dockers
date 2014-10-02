#/bin/bash

. containerinfo

tdir=${HOST_DIR}

if [ ! -d $tdir ]; then
  mkdir -p $tdir
  mkdir "$tdir/rabbitmqbase"
  mkdir "$tdir/rabbitmqlogs"

  cp rabbitmq.config $tdir

  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
