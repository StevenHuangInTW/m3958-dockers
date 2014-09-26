#/bin/bash

tdir=/opt/dockerdata/varnish4

if [ ! -d $tdir ]; then
  mkdir -p "$tdir/log"

  cp supervisord.conf  $tdir

  cp varnish.config $tdir
  cp default.vcl $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir
else
  echo "$tdir already exist."
fi
