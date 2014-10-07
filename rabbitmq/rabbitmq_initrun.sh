#!/bin/bash


/util/base_initrun.sh
. /util/initfunctions.sh

pn=rabbitmq

create_skeleton \
  $pn \
  /rabbitmq_run.sh \
  /rabbitmq.config \
  rabbitmq

