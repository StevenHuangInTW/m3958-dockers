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
  --logpath=/var/log/php-fpm \
  --servicename=php-fpm \
  --imgname=m3958/php-fpm

popd >/dev/null
