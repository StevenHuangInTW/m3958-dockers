#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >>/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"

echo $(privilegedstr)

docker run --rm -it \
    $(privilegedstr) \
    ${DEBUG_DIR_MAP} \
    ${DOCKER_PRA} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    ${INIT_RUNNER}

popd
