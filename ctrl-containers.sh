#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

. functions

MY_ARGS=$(getopt -o "p:" -l "action:,appname:,imgname:,servicename:,logpath:,link:,volumes-from:,has-datavol,dns:,has-supervisord-log" -n "" -- "$@")

eval set -- "$MY_ARGS"

#for x in "$@"; do
#  echo $x
#done
#exit 0

action=""
pmap=""
links=""
volfroms=""
dns=""
hasdatavol=""
hassupervisordlog=""

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
    -p)
      shift;pmap="${pmap} -p $1 ";shift;;
    --link)
      shift;links="${links} --link $1 ";shift;;
    --volumes-from)
      shift;volfroms="${volfroms} --volumes-from $1 ";shift;;
    --has-datavol)
      shift;hasdatavol="yes";;
    --has-supervisord-log)
      shift;hassupervisordlog="yes";;
    --dns)
      shift;dns="${dns} --dns $1 ";shift;;
    --)
       shift;break;;
  esac
done

if [ -n "${hassupervisordlog}" ];then
  echo "hassupervisordlog: ${hassupervisordlog}"
fi
appname=${appname-appname}
imgname=${imgname}

names=$(sn_logn_cn ${appname} ${servicename})

#split string
na=(${names///})
service_cn=${na[0]}
logn=${na[1]}
cn=${na[2]}
supvisorlogcn=${na[3]}
data_cn=${na[4]}

configpath=/m3958dir/config

datavolfrom=""
if [ -n "$hasdatavol" ]; then
  datavolfrom="--volumes-from ${data_cn}"
fi
supvolfrom=""
if [ -n "${hassupervisordlog}" ]; then
  supvolfrom="--volumes-from ${supvisorlogcn}"
fi

init_c () {
  if [ -n "$logpath" ]; then
    docker run -d -v ${logpath} --name ${logn}  ${imgname} echo ${logn}
  fi
  if [ -n "$hassupervisordlog" ];then
    docker run -d -v /var/log/supervisor  --name ${supvisorlogcn}  ${imgname} echo ${supvisorlogcn}
  fi
  if [ -n "$hasdatavol" ]; then
    echo "with data vol: ${data_cn}"
    docker run -d -v /m3958dir/data  --name ${data_cn}  ${imgname} echo ${data_cn}
  fi
  docker run -d -v ${configpath}  --name ${cn}  ${imgname} echo ${cn}
}

start_c () {
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
        ${datavolfrom} \
        ${supvolfrom} \
        $volfroms \
        $dns \
        $pmap \
        ${links} \
        --name ${service_cn} \
        ${imgname}
    fi
  fi
}


debug_c () {
  docker run --rm -it \
    --volumes-from ${logn} \
    --volumes-from ${cn} \
    ${datavolfrom} \
    ${supvolfrom} \
    -v /opt/dockerdata:/hostdir \
    ${links} \
    $dns \
    ${imgname} \
    /bin/bash
}

debug_with_port () {

  docker run --rm -it \
    --volumes-from ${logn} \
    --volumes-from ${cn} \
    ${datavolfrom} \
    ${supvolfrom} \
    -v /opt/dockerdata:/hostdir \
    $pmap \
    ${links} \
    $dns \
    ${imgname} \
    /bin/bash
}
stop_c () {
  docker stop ${service_cn}
}

restart_c () {
  stop_c
  start_c
}

editconfig () {
  echo "please edit files in ${configpath} folder"
  docker run --rm -it --volumes-from ${cn} ${imgname} /bin/bash
}

remove_c () {
  read -p "all cutomized data will lost, are you sure?" confirm
  case $confirm in
    Y|y)
      echo "removing..."
      docker rm ${logn}
      docker rm ${cn}
      docker rm ${supvisorlogcn}
      docker rm ${data_cn}
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
}

viewlog () {
  echo "please view log files in ${logpath} folder"
  docker run --rm -it --volumes-from ${logn} ${imgname} /bin/bash
}

case $action in
  init)
    init_c;;
  start)
    start_c;;
  debug)
    debug_c;;
  debugwithport)
    debug_with_port;;
  stop)
    stop_c;;
  editconfig)
    editconfig;;
  remove)
    remove_c;;
  viewlog)
    viewlog;;
  restart)
    restart_c;;
  *)
    echo "usage: --action=init,start,stop,restart,debug,editconfig,viewlog";;
esac

popd >/dev/null
