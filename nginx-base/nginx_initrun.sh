#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.
/util/base_initrun.sh
. /util/initfunctions.sh

pn=nginx

create_skeleton \
  $pn \
  /ngixn_run.sh \
  /${pn}.conf.json \
  /nginx_default.conf;/nginx.conf
  nginx
