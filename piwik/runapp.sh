#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >/dev/null

echo "current directory: $curdir"

. "../functions"
. "containerinfo"

action=$1

cnames=(piwik_db piwik_phpfpm piwik_nginx)
runners=(../mysql5 ../php-fpm ../nginx-base)
dockerprabase="--volumes-from piwik_data_vol"
dockerpra=""
cname=""
runner=""

if [ "stop" = "$action" ]; then
  for cn in "${cnames[@]}"
  do
    docker stop $cn
  done
elif [[ "remove" = "$action" || "rm" = "$action" ]]; then
  for cn in "${cnames[@]}"
  do
    docker rm $cn
  done
else
  for i in 0 1 2
  do
#    pushd $curdir >/dev/null 2>&1
    cname=${cnames[$i]}
    runner=${runners[$i]}
    if [ ! "yes" = "$(container_running $cname)" ]; then
      if [ "yes" = "$(container_exist $cname)" ]; then
        docker start $cname
      else
       if [ piwik_phpfpm = "$cname" ]; then
        dockerpra="${dockerprabase} --link piwik_db:piwik_db" 
       elif [ piwik_nginx = "$cname" ]; then
        dockerpra="${dockerprabase} --link piwik_phpfpm:piwik_phpfpm" 
       else
         dockerpra=""
       fi
       echo $dockerpra

        /bin/bash ${runner}/rundocker.sh \
                --hostdir="$HOST_DIR" \
                --cname="${cnames[$i]}" \
                --dockerpra="${dockerpraa}"
#       popd
      fi
    fi    
  done
fi

#piwik_phpfpm must link to piwik_db
#piwik_nginx must link to piwik_phpfpm
