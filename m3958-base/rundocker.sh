#!/bin/bash
. containerinfo

docker run --rm -it \
    ${IMG_NAME} \
    /bin/bash
