#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

MY_ARGS=$(getopt -o a:b:c -l "action:,appname:,imgname:" -n "" -- "$@")
eval set -- "$MY_ARGS"

while true; do
  case "$1" in
    --action)
      shift;action=$1;shift;;
    --appname)
      shift;appname=$1;shift;;
    --imgname)
      shift;imgname=$1;shift;;
    --)
       shift;break;;
  esac
done

. ../functions

appname=${appname-appname}
imgname=${imgname-m3958/nginx}

names=$(sn_logn_cn ${appname} nginx)

#split string
na=(${names///})
servicen=${na[0]}
logn=${na[1]}
cn=${na[2]}
configpath=/m3958dir/config/nginx

if [ "init" = "${action}" ]; then
  docker run -d -v /var/log/nginx --name ${logn}  ${imgname} echo ${logn}
  docker run -d -v ${configpath}  --name ${cn}  ${imgname} echo ${cn}
elif [ "start" = "${action}" ]; then
  if [ ! "yes" = $( container_running ${servicen} ) ]; then
    if [ "yes" = $(container_exist ${servicen}) ]; then
      docker start ${servicen}
    else
      docker run -d \
        --volumes-from ${logn} \
        --volumes-from ${cn} \
        -p 8080:80 \
        --name ${servicen} \
        ${imgname}
    fi
  fi
elif [ "stop" = "${action}" ]; then
  docker stop ${servicen}
elif [ "editconfig" = "${action}" ]; then
  echo "please edit files in ${configpath} folder, wait 5 sec..."
  sleep 5
  docker run --rm -it --volumes-from ${cn} ${imgname} /bin/bash
else
  echo "usage: --action=init,start,stop,editconfig"
fi

popd >/dev/null
