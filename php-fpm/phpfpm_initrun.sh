#!/bin/bash

/util/base_initrun.sh
. /util/initfunctions.sh

pn=php-fpm

create_skeleton \
  $pn \
  /phpfpm_run.sh \
  /php-fpm.conf;/php-fpm-www.conf;/php.ini \
  apache
