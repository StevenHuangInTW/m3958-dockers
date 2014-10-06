#!/bin/bash

bn=dockerbuild.sh
/bin/bash m3958-base/$bn
/bin/bash m3958-base-ssh/$bn
/bin/bash m3958-vertx/$bn
/bin/bash mysql5/$bn
/bin/bash nginx-base/$bn
/bin/bash php-fpm/$bn
/bin/bash rabbitmq/$bn
/bin/bash solr/$bn
/bin/bash varnish4/$bn
/bin/bash vertx-combo/$bn

