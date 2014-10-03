#!/bin/bash

datadir=/opt/runningdir/mysqldata
logdir=/opt/runningdir/mysqllog

duser=$(stat -c %U ${datadir})

if [ ! $duser = "mysql" ]
then
  chown -R mysql:mysql ${datadir}
fi

duser=$(stat -c %U ${logdir})

if [ ! $duser = "mysql" ]
then
  chown -R mysql:mysql ${logdir}
fi

exec /usr/bin/mysqld_safe
