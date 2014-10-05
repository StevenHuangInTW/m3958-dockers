#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.
flagf=/.mysql.initialized

if [ -f "${flagf}" ]; then
  exit 0
fi

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

pn=mysql5

runner=/mysqld_run.sh

rdr=/opt/runningdir/mysql
data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"
user=mysql

if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
  echo "[program:${pn}]" >> $ssconf
  echo "command=${runner}" >> $ssconf
fi

if [ ! -e "$data" ]; then
  mkdir -p "$data"
  chown -R "${user}:${user}" "$data"
fi

if [ ! -e "$log" ]; then
  mkdir -p "$log"
  chown -R "${user}:${user}" "$log"
fi

if [ ! -e "$cfg" ]; then
  mkdir -p "$cfg"
fi

if [ ! -f "${cfg}/my.cnf" ]; then
  cp /etc/my.cnf "${cfg}/"
fi

touch ${flagf}
