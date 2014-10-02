#!/bin/bash

. containerinfo
. ../functions

docker run --rm -it \
    --link=vertxanonymous:vertxanonymous --link=vertxcombo:vertxcombo \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    /bin/bash
