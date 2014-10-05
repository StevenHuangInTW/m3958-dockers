#!/bin/bash

  bash ./piwik_db_d/initrun.sh

  bash ./piwik_nginx_d/initrun.sh

  bash ./piwik_phpfpm_d/initrun.sh

  volname=piwik_data_vol

  if [ -z "$(docker ps -a|grep [^/]${volname})" ]; then
    docker run -d -v /piwikroot --name ${volname} m3958/piwik:2.7.0 echo create piwik data volume
  fi
