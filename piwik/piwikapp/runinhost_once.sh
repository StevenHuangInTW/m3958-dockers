#/bin/bash

. containerinfo

tdir=${HOST_DIR}

if [ ! -d $tdir ]; then
  mkdir -p $tdir
  mkdir -p $tdir/nginxlog
  mkdir -p $tdir/php-fpmlog

  cp -R nginx $tdir

  cp -R php-fpm $tdir
  cp supervisord.conf  $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
