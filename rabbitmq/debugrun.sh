#!/bin/bash

. containerinfo
. ../functions

docker run --rm -it \
    --hostname=rabbitmqhostone \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    /bin/bash
