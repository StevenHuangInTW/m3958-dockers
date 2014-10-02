#/bin/bash

. containerinfo

tdir=${HOST_DIR}


if [ ! -d $tdir ]; then
  mkdir -p "$tdir/static"
  mkdir -p "$tdir/log/mongodb"
  mkdir -p "$tdir/mongodb"

  mkdir -p "$tdir/log/redis"
  mkdir -p "$tdir/redis"

  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp conf.json $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

  cp vertxcombo-0.0.3-mod.zip $tdir
else
  echo "$tdir already exist."
fi
