#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

MY_ARGS=$(getopt -o a:b:c -l "action:,appname:,imgname:,servicename:,logpath:,pmap:" -n "" -- "$@")
eval set -- "$MY_ARGS"

pmap=""

while true; do
  case "$1" in
    --action)
      shift;action=$1;shift;;
    --appname)
      shift;appname=$1;shift;;
    --imgname)
      shift;imgname=$1;shift;;
    --logpath)
      shift;logpath=$1;shift;;
    --servicename)
      shift;servicename=$1;shift;;
    --pmap)
      shift;pmap="-p $1 ";shift;;
    --)
       shift;break;;
  esac
done

. functions

appname=${appname-appname}
imgname=${imgname}

names=$(sn_logn_cn ${appname} ${servicename})

#split string
na=(${names///})
service_cn=${na[0]}
logn=${na[1]}
cn=${na[2]}
configpath=/m3958dir/config

if [ "init" = "${action}" ]; then
  docker run -d -v ${logpath} --name ${logn}  ${imgname} echo ${logn}
  docker run -d -v ${configpath}  --name ${cn}  ${imgname} echo ${cn}
elif [ "start" = "${action}" ]; then
  if [ ! "yes" = $( container_running ${service_cn} ) ]; then
    if [ "yes" = $(container_exist ${service_cn}) ]; then
      docker start ${service_cn}
    else
      docker run -d \
        --volumes-from ${logn} \
        --volumes-from ${cn} \
        $pmap \
        --name ${service_cn} \
        ${imgname}
    fi
  fi
elif [ "stop" = "${action}" ]; then
  docker stop ${service_cn}
elif [ "editconfig" = "${action}" ]; then
  echo "please edit files in ${configpath} folder, wait 5 sec..."
  sleep 5
  docker run --rm -it --volumes-from ${cn} ${imgname} /bin/bash
else
  echo "usage: --action=init,start,stop,editconfig"
fi

popd >/dev/null
