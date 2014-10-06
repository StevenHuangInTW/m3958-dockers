#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >/dev/null

echo "current directory: $curdir"

. "../functions"
. "containerinfo"

action=$1

cnames=(piwik_nginx piwik_db piwik_phpfpm)
runners=(../nginx-base ../mysql5 ../php-fpm)

if [ "stop" = "$action" ]; then
  for cn in "${cnames[@]}"
  do
    docker stop $cn
  done
elif [ "remove" = "$action" ]; then
  for cn in "${cnames[@]}"
  do
    docker rm $cn
  done
else
  for i in 0 1 2
  do
    if [ ! "yes" = "$(container_running ${cnames[$i]})" ]; then
      if [ "yes" = "$(container_exist ${cnames[$i]})" ]; then
        docker start ${cnames[$i]}
      else
       pushd $curdir >/dev/null
        /bin/bash ${runners[$i]}/rundocker.sh --hostdir=$HOST_DIR --cname=${cnames[$i]} --dockerpra="--volumes-from piwik_data_vol"
       popd
      fi
    fi    
  done
fi
