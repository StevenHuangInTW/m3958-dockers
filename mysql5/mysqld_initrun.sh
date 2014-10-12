#!/bin/bash

cfgf=/m3958dir/config/my.cnf

if [ ! -e /m3958dir/data/mysql ];then
  mysql_install_db --defaults-file=$cfgf
fi

mysqld_safe --defaults-file=$cfgf >/dev/null 2>&1 &

RPASS=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 8 | xargs)

msi=/usr/bin/mysql_secure_installation

sed -i "s/read password1/password1=${RPASS}/" $msi
sed -i "s/read password2/password2=${RPASS}/" $msi
sed -i "s/read password/password=/" $msi
sed -i "s/read reply/reply=Y/" $msi

mysql_secure_installation

echo "mysql root pwd:$RPASS" >> /m3958dir/config/pwdfile_to_delete

#mysql_secure_installation <<YYYY
#
#Y
#$RPASS
#$PRASS
#Y
#Y
#Y
#Y
#YYYY
#
#echo "mysql root use cann't access from remote" > /m3958dir/config/mysqlinit.readme
#
#echo "root password is: ${PRASS}" >> /m3958dir/config/mysqlinit.readme


