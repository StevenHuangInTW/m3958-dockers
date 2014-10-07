#!/bin/bash

/util/base_initrun.sh
. /util/initfunctions.sh

pn=varnish4

create_skeleton \
  $pn \
  /varnish4_run.sh \
  /default.vcl;/varnish.config

