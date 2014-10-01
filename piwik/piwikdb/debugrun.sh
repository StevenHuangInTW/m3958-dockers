#!/bin/bash
. ../../functions

. containerinfo

docker run $(privilegedstr) \
    --rm -it \
    ${DIR_MAP} \
    ${IMG_NAME} \
    /bin/bash
