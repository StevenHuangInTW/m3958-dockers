#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

if [ -z "$1" ]; then
  echo "please add action parameter:init,start,stop,editconfig"
  exit 0
fi

/bin/bash ../ctrl-containers.sh \
  --action=$1 \
  --appname=appname \
  --logpath=/var/log/nginx \
  --servicename=nginx \
  --imgname=m3958/nginx \
  -p=8080:80

popd >/dev/null
