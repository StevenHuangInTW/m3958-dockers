#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/containerinfo"
. "$(dirname ${BASH_SOURCE[0]})/../../functions"

docker run -d \
    --volumes-from piwik_data_vol \
    --name ${CONTAINER_NAME} \
    $(privilegedstr) \
    ${PORT_MAP} \
    ${DIR_MAP} \
    ${IMG_NAME}
