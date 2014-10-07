#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/vertx_initrun.sh
. /util/initfunctions.sh

pn=anonymousupload

create_skeleton \
  $pn \
  /${pn}_run.sh \
  /${pn}.conf.json


