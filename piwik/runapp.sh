#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../functions"

action=$1

cnames=(piwik_nginx piwik_db piwik_phpfpm)

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
  for cn in "${cnames[@]}"
  do
    if [ ! "yes" = "$(container_running ${cn})" ]; then
      if [ "yes" = "$(container_exist ${cn})" ]; then
        docker start $cn
      else
        /bin/bash ${cn}_d/rundocker.sh
      fi
    fi    
  done
fi
