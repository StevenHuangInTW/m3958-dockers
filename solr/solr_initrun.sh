#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:solr") ]; then
  echo "[program:solr]" >> $ssconf
  echo "command=/util/solr_run.sh" >> $ssconf
fi

rdr=/opt/runningdir/solr_cfg

if [ ! -e ${rdr} ]; then
  mkdir ${rdr}
  cp -f /solr_cfg/solr.xml ${rdr}
  cp -f /solr_cfg/schema.xml ${rdr}
fi



