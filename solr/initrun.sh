#!/bin/bash

. containerinfo
. ../functions
echo $(privilegedstr)

docker run --rm -it \
    $(privilegedstr) \
    ${DIR_MAP} \
    -v /root/m3958-dockers:/m3958-dockers \
    -v /opt/dockerdata/solr:/opt/runningdir \
    ${IMG_NAME} \
    /util/solr_initrun.sh
