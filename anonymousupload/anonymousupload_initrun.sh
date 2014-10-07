#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/vertx_initrun.sh
. /util/initfunctions.sh

create_skeleton anonymousupload /anonymousupload_run.sh /anonymousupload.conf.json


