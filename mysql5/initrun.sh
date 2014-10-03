#!/bin/bash

. containerinfo
. ../functions
echo $(privilegedstr)

docker run --rm -it \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    /util/mysqlinitrun.sh
