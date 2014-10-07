#!/bin/bash


curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >>/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"

docker run --rm -it \
    $(privilegedstr) \
    -v /root/m3958-dockers:/m3958-dockers \
    ${DOCKER_PRA} \
    -v /opt/dockerdata/solr:/opt/runningdir \
    ${IMG_NAME} \
    /util/solr_initrun.sh

popd
