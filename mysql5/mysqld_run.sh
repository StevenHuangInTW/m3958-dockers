#!/bin/bash

cfgf=/m3958dir/config/my.cnf

if [ ! -e /m3958dir/data/mysql ];then
  mysql_install_db --defaults-file=$cfgf
fi


exec /usr/bin/mysqld_safe --defaults-file=$cfgf
