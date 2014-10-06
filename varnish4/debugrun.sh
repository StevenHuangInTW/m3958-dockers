#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir

. "../opt.sh"
. "containerinfo"
. "../functions"

docker run --rm -it \
    --link=vertxanonymous:vertxanonymous --link=vertxcombo:vertxcombo \
    $(privilegedstr) \
    ${DIR_MAP} \
    ${DOCKER_PRA} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    /bin/bash

popd
