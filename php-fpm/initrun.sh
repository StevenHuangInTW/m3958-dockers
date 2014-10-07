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
    -v /root/m3958-dockers:/m3958-dockers \
    ${DOCKER_PRA} \
    ${IMG_NAME} \
    ${INIT_RUNNER}
popd
