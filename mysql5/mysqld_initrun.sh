#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:mysql5") ]; then
  echo "[program:mysql5]" >> $ssconf
  echo "command=/util/mysqld_run.sh" >> $ssconf
fi

rdr=/opt/runningdir/mysql
data="${rdr}/data"
log="${rdr}/log"

if [ ! -e "$data" ]; then
  mkdir -p "$data"
  chown -R mysql:mysql "$data"
fi

if [ ! -e "$log" ]; then
  mkdir -p "$log"
  chown -R mysql:mysql "$log"
fi

