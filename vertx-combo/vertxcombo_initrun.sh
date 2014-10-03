#!/bin/bash

#because m3958/base alreay put baseinitrun.sh in /util/ folder.

/util/vertxinitrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:vertxcombo") ]; then
  echo "[program:vertxcombo]" >> $ssconf
  echo "command=/vertxcomborun.sh" >> $ssconf
fi

rdr=/opt/runningdir
vertxdir="${rdr}/vertxcombo"

if [ ! -e "${vertxdir}" ]; then
  mkdir -p ${vertxdir}
  cp /vertxcombo.conf.json "${vertxdir}"
fi

