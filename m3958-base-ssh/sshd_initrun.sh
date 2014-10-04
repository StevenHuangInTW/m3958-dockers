#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:sshd") ]; then
  echo "[program:sshd]" >> $ssconf
  echo "command=/util/sshd_run.sh" >> $ssconf
fi

