#!/bin/bash

if [ ! -f /.mysql.initialized ]; then
  /util/mysqld_initrun.sh
fi
exec /usr/bin/mysqld_safe
