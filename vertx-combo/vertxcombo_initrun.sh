#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/vertx_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:vertxcombo") ]; then
  echo "[program:vertxcombo]" >> $ssconf
  echo "command=/vertxcombo_run.sh" >> $ssconf
fi

rdr=/opt/runningdir/vertxcombo

app="${rdr}/app"

if [ ! -e "${app}" ]; then
  mkdir -p ${app}
  cp /vertxcombo.conf.json "${app}"
fi

