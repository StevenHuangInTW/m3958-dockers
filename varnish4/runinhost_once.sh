#/bin/bash

tdir=/opt/dockerdata/varnish4

if [ ! -d $tdir ]; then
  mkdir -p "$tdir/log"

  cp supervisord.conf  $tdir

  cp varnish.config $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir
fi
