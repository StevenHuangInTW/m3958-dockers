#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

MY_ARGS=$(getopt -o a:b:c -l "action:,appname:,imgname:,servicename:,logpath:,p:,link:,volumes-from:" -n "" -- "$@")
eval set -- "$MY_ARGS"

pmap=""
links=""
volfroms=""

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
    --p)
      shift;pmap="${pmap} -p $1 ";shift;;
    --link)
      shift;links="${links} --link $1 ";shift;;
    --volumes-from)
      shift;volfroms="${volfroms} --volumes-from $1 ";shift;;
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

echo "$service_cn is running: $(container_running ${service_cn})"

if [ "init" = "${action}" ]; then
  docker run -d -v ${logpath} --name ${logn}  ${imgname} echo ${logn}
  docker run -d -v ${configpath}  --name ${cn}  ${imgname} echo ${cn}
elif [ "start" = "${action}" ]; then
  if [ ! "yes" = $(container_running ${service_cn}) ]; then
    if [ "yes" = $(container_exist ${service_cn}) ]; then
      docker start ${service_cn}
    else
      if [ -n "${links}" ]; then
        echo "with links: ${links}"
      fi
      docker run -d \
        --volumes-from ${logn} \
        --volumes-from ${cn} \
        $volfroms \
        $pmap \
        ${links} \
        --name ${service_cn} \
        ${imgname}
    fi
  fi
elif [ "debug" = "${action}" ]; then
  docker run --rm -it \
    --volumes-from ${logn} \
    --volumes-from ${cn} \
    ${links} \
    ${imgname} \
    /bin/bash
elif [ "stop" = "${action}" ]; then
  docker stop ${service_cn}
elif [ "editconfig" = "${action}" ]; then
  echo "please edit files in ${configpath} folder"
#  sleep 5
  docker run --rm -it --volumes-from ${cn} ${imgname} /bin/bash
elif [ "remove" = "${action}" ]; then
  read -p "all cutomized data will lost, are you sure?" confirm
  case $confirm in
    Y|y)
      echo "removing..."
      docker rm ${logn}
      docker rm ${cn}
      if [ "yes" = $( container_running ${service_cn} ) ]; then
        docker stop ${service_cn}
      fi
      if [ "yes" = $(container_exist ${service_cn}) ]; then
        docker rm ${service_cn}
      fi
      ;;
    *)
      echo "you answer is: ${confirm}";;
  esac
elif [ "viewlog" = "${action}" ]; then
  echo "please view log files in ${logpath} folder"
#  sleep 5
  docker run --rm -it --volumes-from ${logn} ${imgname} /bin/bash
else
  echo "usage: --action=init,start,stop,debug,editconfig,viewlog"
fi

popd >/dev/null
