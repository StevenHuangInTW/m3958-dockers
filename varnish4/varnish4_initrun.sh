#!/bin/bash

#because m3958/base alreay put baseinitrun.sh in /util/ folder.

/util/baseinitrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:varnish4") ]; then
  echo "[program:varnish4]" >> $ssconf
  echo "command=/util/varnish4_run.sh" >> $ssconf
fi

rdr=/opt/runningdir

vdir="${rdr}/varnish4"

if [ ! -e "${vdir"} ]; then
  mkdir "${vdir"}
  cp /default.vcl ${vdir}
  cp /varnish.config ${vdir}
fi


