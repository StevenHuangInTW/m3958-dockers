#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh
. /util/initfunctions.sh

pn=mysql5

create_skeleton \
  $pn \
  /mysqld_run.sh \
  /etc/my.cnf \
  mysql

