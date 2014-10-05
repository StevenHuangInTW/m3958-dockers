#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../opt.sh"
. "$(dirname ${BASH_SOURCE[0]})/containerinfo"
. "$(dirname ${BASH_SOURCE[0]})/../functions"

docker run --rm -it \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${DOCKER_PRA} \
    ${IMG_NAME} \
    /bin/bash
