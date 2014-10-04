#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf
pn=php-fpm
runner=/util/phpfpm_run.sh

rdr=/opt/runningdir/phpfpm
data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"
user=apache

if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
  echo "[program:${pn}]" >> $ssconf
  echo "command=/util/${runner}" >> $ssconf
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
  chown -R "${user}:${user}" "$cfg"
fi
