#!/bin/bash

cfgf=/m3958dir/config/my.cnf

if [ ! -e /m3958dir/data/mysql ];then
  mysql_install_db --defaults-file=$cfgf
fi

mysql_safe --defaults-file=$cfgf >/dev/null 2>&1 &

RPASS=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 8 | xargs)

mysql_secure_installation <<YYYY

Y
$RPASS
$PRASS
Y
Y
Y
Y
YYYY
