#/bin/bash

. containerinfo

tdir=${HOST_DIR}

if [ ! -d $tdir ]; then
  mkdir -p $tdir
 
  mkdir -p "$tdir/log"
  cp ../../mysql5/my.cnf $tdir

  cp ../../mysql5/supervisord.conf  $tdir
  cp ../../mysql5/addn-hosts $tdir
  cp ../../mysql5/dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi
