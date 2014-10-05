#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../opt.sh"
. "$(dirname ${BASH_SOURCE[0]})/containerinfo"
. "$(dirname ${BASH_SOURCE[0]})/../functions"

docker run --rm -it \
    $(privilegedstr) \
    -v /root/m3958-dockers:/m3958-dockers \
    ${DOCKER_PRA} \
    -v /opt/dockerdata/solr:/opt/runningdir \
    ${IMG_NAME} \
    /util/solr_initrun.sh
