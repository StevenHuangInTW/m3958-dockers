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

names=$(sn_logn_bcn_cn ${appname} nginx)

#split string
na=(${names///})
servicen=${na[0]}
logn=${na[1]}
bcn=${na[2]}
cn=${na[3]}

if [ "init" = "${action}" ]; then
  docker run -d -v /var/log/nginx --name ${logn}  m3958/nginx echo ${na[1]}
  docker run -d -v /m3958baseconfig  --name ${bcn}  m3958/nginx echo ${na[2]}
  docker run -d -v /etc/nginx  --name ${cn}  m3958/nginx echo ${na[3]}
elif [ "start" = "${action}" ]; then
  if [ ! "yes" = $( container_running ${servicen} ) ]; then
    if [ "yes" = $(container_exist ${servicen}) ]; then
      docker start ${servicen}
    else
      docker run -d \
        --volumes-from ${logn} \
        --volumes-from ${bcn} \
        --volumes-from ${cn} \
        -p 8080:80 \
        --name ${servicen} \
        ${imgname}
    fi
  fi
elif [ "stop" = "${action}" ]; then
  docker stop ${servicen}
elif [ "editconfig" = "${action}" ]; then
  echo "please edit files in /etc/nginx folder, wait 5 sec..."
  sleep 5
  docker run --rm -it --volumes-from ${cn} ${imgname} /bin/bash
elif [ "editbaseconfig" = "${action}" ]; then
  echo "please edit files in /m3958baseconfig folder, wait 5 sec..."
  sleep 5
  docker run --rm -it --volumes-from ${bcn} ${imgname} /bin/bash
else
  echo "usage: --action=init,start,stop,editconfig,editbaseconfig"
fi

popd >/dev/null
