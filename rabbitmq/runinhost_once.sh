#/bin/bash

tdir=/opt/dockerdata/anonymousupload

if [ ! -d $tdir ]; then
  mkdir -p $tdir
  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
