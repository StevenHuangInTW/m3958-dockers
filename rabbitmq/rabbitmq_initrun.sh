#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

pn=rabbitmq
runner=/util/rabbitmq_run.sh

rdr=/opt/runningdir/rabbitmq
data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"

user=rabbitmq

if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
  echo "[program:${pn}]" >> $ssconf
  echo "command=${runner}" >> $ssconf
fi

if [ ! -e "$data" ]; then
  mkdir -p "$data"
fi

if [ ! -e "$log" ]; then
  mkdir -p "$log"
fi

if [ ! -e "$cfg" ]; then
  mkdir -p "$cfg"
  cp /rabbitmq.config "${cfg}/"
fi

