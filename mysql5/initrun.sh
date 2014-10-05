#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../opt.sh"
. "$(dirname ${BASH_SOURCE[0]})/containerinfo"
. "$(dirname ${BASH_SOURCE[0]})/../functions"

echo $(privilegedstr)

docker run --rm -it \
    $(privilegedstr) \
    ${DEBUG_DIR_MAP} \
    ${DOCKER_PRA} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    ${INIT_RUNNER}
