#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir

. "../opt.sh"
. "containerinfo"
. "../functions"

docker run -d \
    --name ${CONTAINER_NAME} \
    $(privilegedstr) \
    ${PORT_MAP} \
    ${DIR_MAP} \
    ${IMG_NAME}

popd
