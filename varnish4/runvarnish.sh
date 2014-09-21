#!/bin/bash

. /opt/runningdir/varnish.config

exec /usr/sbin/varnishd $DAEMON_OPTS
