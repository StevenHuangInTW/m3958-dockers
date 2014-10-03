#!/bin/bash

#because m3958/base alreay put baseinitrun.sh in /util/ folder.

/util/baseinitrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:sshd") ]; then
  echo "[program:sshd]" >> $ssconf
  echo "command=/util/runsshd.sh" >> $ssconf
fi

