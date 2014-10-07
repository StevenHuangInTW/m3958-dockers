#!/bin/bash

/util/base_initrun.sh
. /util/initfunctions.sh

pn=solr

create_skeleton \
  $pn \
  /solr_run.sh \
  /solr_cfg/solr.xml;/solr_cfg/schema.xml

