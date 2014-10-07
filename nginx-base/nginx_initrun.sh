#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.
flagf=/.nginx_initialized

if [ -f "$flagf" ]; then
  exit 0
fi

/util/base_initrun.sh

pn=nginx
runner=/nginx_run.sh

rdr=/opt/runningdir/nginx
if [ ! -e "$rdr" ]; then
  mkdir $rdr
fi

cp -R /cfgdir/supervisor.d $rdr

ssconf="${rdr}supervisor.d/supervisord.conf"

data="${rdr}/data"
log="${rdr}/log"
cfg="${rdr}/cfg"
user=nginx

if [ -z $(cat ${ssconf}|grep "program:${pn}") ]; then
  echo "[program:${pn}]" >> $ssconf
  echo "command=${runner}" >> $ssconf
fi


echo "$data"
echo "$log"
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
  cp /nginx_default.conf ${cfg}
  cp /nginx.conf ${cfg}
fi

touch $flagf
