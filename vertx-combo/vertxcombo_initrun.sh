#!/bin/bash

/util/vertx_initrun.sh
. /util/initfunctions.sh

pn=vertxcombo

create_skeleton \
  $pn \
  /vertxcombo_run.sh \
  /vertxcombo.conf.json 

mkdir "opt/runningdir/${pn}/static"
echo "hello vertxcombo" > "/opt/runningdir/${pn}/static/index.js"
