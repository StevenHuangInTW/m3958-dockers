#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"

docker run -d \
    --name ${CONTAINER_NAME} \
    $(privilegedstr) \
    ${PORT_MAP} \
    ${DOCKER_PRA} \
    ${DIR_MAP} \
    ${IMG_NAME}

popd >/dev/null
