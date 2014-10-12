#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

if [ -z "$1" ]; then
  echo "please add action parameter:init,start,stop,editconfig"
  exit 0
fi

/bin/bash ../ctrl-containers.sh \
  --action="$1" \
  --appname=appname \
  --logpath=/var/log/mysql \
  --servicename=mysql5 \
  --has-supervisord-log \
  --has-datavol \
  --imgname=m3958/mysql:5.1.73 \
  --dns=127.0.0.1 \
  --dns=223.5.5.5 \
  --dns=223.6.6.6

popd >/dev/null

