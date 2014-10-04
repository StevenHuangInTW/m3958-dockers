#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:rabbitmq") ]; then
  echo "[program:rabbitmq]" >> $ssconf
  echo "command=/util/rabbitmq_run.sh" >> $ssconf
fi

rdr=/opt/runningdir/rabbitmq
rbqbase="${rdr}/base"
rbqlog="${rdr}/log"

if [ ! -e "$rdr" ]; then
  mkdir $rdr
  cp /rabbitmq.config "${rdr}/"
fi

if [ ! -e "$rbqbase" ]; then
  mkdir -p "$rbqbase"
fi

if [ ! -e "$rbqlog" ]; then
  mkdir -p "$rbqlog"
fi

