#!/bin/bash

duser=$(stat -c %U /opt/runningdir)

if [ ! $duser = "mysql" ]
then
  chown -R mysql:mysql /opt/runningdir
fi

exec /usr/bin/mysqld_safe
