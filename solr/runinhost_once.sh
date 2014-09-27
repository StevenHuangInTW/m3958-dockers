#/bin/bash

tdir=/opt/dockerdata/solr

if [ ! -d $tdir ]; then
  mkdir -p $tdir

  cp -R solr $tdir
  mkdir -p "$tdir/log/mongodb"
  mkdir -p "$tdir/mongodb"

  mkdir -p "$tdir/log/redis"
  mkdir -p "$tdir/redis"
  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
