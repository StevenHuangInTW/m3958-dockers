#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/vertx_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

pn=vertxcombo

runner=/vertxcombo_run.sh

rdr=/opt/runningdir/vertxcombo
data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"

if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
  echo "[program:${pn}]" >> $ssconf
  echo "command=${runner}" >> $ssconf
fi


if [ ! -e "$data" ]; then
  mkdir -p "$data"
  mkdir "${data}/static"
  echo "hello vertxcombo" > "${data}/static/index.js"
fi

if [ ! -e "$log" ]; then
  mkdir -p "$log"
fi

if [ ! -e "$cfg" ]; then
  mkdir -p "$cfg"
  cp /vertxcombo.conf.json "${cfg}"
fi
