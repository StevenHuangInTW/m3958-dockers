#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >>/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"

echo $(privilegedstr)

docker run --rm -it \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    ${IMG_NAME} \
    /util/rabbitmq_initrun.sh

popd
