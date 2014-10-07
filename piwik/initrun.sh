#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >>/dev/null

. "../opt.sh"
. "containerinfo"
. "../functions"


/bin/bash ../mysql5/initrun.sh --hostdir=$HOST_DIR
/bin/bash ../nginx-base/initrun.sh --hostdir=$HOST_DIR
/bin/bash ../php-fpm/initrun.sh --hostdir=$HOST_DIR

volname=piwik_data_vol

if [ -z "$(docker ps -a|grep [^/]${volname})" ]; then
  docker run -d -v /piwikroot --name ${volname} ${IMG_NAME} echo create piwik data volume
fi

popd
