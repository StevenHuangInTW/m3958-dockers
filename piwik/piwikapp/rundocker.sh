#!/bin/bash
. ../../functions

. containerinfo

echo $(container_running piwikdb)

if [ $(container_running piwikdb) = "no" ] ;then
  echo "container piwikmysql not running." 
  exit 1
fi

docker run -d \
    --link=piwikdb:piwikdb \
    --name ${CONTAINER_NAME} \
    $(privilegedstr) \
    ${PORT_MAP} \
    ${DIR_MAP} \
    ${IMG_NAME} 

