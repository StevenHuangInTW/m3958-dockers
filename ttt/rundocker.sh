#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >>/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"

docker run --rm -it \
    ${IMG_NAME} \
    /bin/bash

popd
