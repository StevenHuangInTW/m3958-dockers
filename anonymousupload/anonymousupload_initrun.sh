#!/bin/bash

#because m3958/base alreay put baseinitrun.sh in /util/ folder.

/util/vertxinitrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:anonymousupload") ]; then
  echo "[program:anonymousupload]" >> $ssconf
  echo "command=/anonymousuploadrun.sh" >> $ssconf
fi

rdr=/opt/runningdir
vertxdir="${rdr}/anonymousupload"

if [ ! -e "${vertxdir}" ]; then
  mkdir -p ${vertxdir}
  cp /conf.json ${vertxdir}
fi


