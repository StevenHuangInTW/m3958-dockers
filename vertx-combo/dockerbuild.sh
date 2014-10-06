#!/bin/bash


curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir

. "containerinfo"

docker build -t ${IMG_NAME} .

popd
