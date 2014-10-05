#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../opt.sh"
. "$(dirname ${BASH_SOURCE[0]})/containerinfo"
. "$(dirname ${BASH_SOURCE[0]})/../functions"

docker run -d \
    --name ${CONTAINER_NAME} \
    $(privilegedstr) \
    ${DOCKER_PRA} \
    ${PORT_MAP} \
    ${DIR_MAP} \
    ${IMG_NAME}
