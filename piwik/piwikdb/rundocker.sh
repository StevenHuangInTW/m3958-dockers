#!/bin/bash
. ../../functions
. containerinfo

docker run -d \
    $(privilegedstr) \
    --name ${CONTAINER_NAME} \
    ${DIR_MAP} \
    ${PORT_MAP} \
    ${IMG_NAME}
