#/bin/bash

tdir=/opt/dockerdata/mysql5

if [ ! -d $tdir ]; then

  mkdir -p "$tdir/log"

  cp supervisord.conf  $tdir
  cp my.cnf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

  if [ ! -d "$tdir/mysql" ]; then
    cp mysqllib.5173.tar.gz $tdir
    cd $tdir
    tar -zxf mysqllib.5173.tar.gz
    rm -rf mysqllib.5173.tar.gz
  fi

fi
