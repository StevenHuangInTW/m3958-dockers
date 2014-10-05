#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.
flagf=/.initialized

if [ -f ${flagf} ]; then
  exit 0
fi

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf
pn=php-fpm
runner=/phpfpm_run.sh

rdr=/opt/runningdir/php-fpm
data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"
user=apache

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
  cp /php-fpm.conf ${cfg}
  cp /php-fpm-www.conf "${cfg}/www.conf"
  cp /php.ini ${cfg}
fi

touch ${flagf}
