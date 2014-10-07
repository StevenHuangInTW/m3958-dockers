#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/vertx_initrun.sh
. /util/initfunctions.sh

pn=sshd

create_skeleton \
  $pn \
  /util/${pn}_run.sh 

