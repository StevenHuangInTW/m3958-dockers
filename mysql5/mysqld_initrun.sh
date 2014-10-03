#!/bin/bash

#because m3958/base alreay put baseinitrun.sh in /util/ folder.

/util/baseinit_run.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:mysql5") ]; then
  echo "[program:mysql5]" >> $ssconf
  echo "command=/util/mysqld_run.sh" >> $ssconf
fi

rdr=/opt/runningdir

if [ ! -e "${rdr}/mysqldata" ]; then
  mkdir "${rdr}/mysqldata"
  chown -R mysql:mysql "${rdr}/mysqldata"
fi

if [ ! -e "${rdr}/mysqllog" ]; then
  mkdir "${rdr}/mysqllog"
  chown -R mysql:mysql "${rdr}/mysqllog"
fi

