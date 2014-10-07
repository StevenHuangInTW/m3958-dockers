#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >>/dev/null

. "containerinfo"

docker build -t ${IMG_NAME} .

popd
