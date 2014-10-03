#!/bin/bash

. /opt/runningdir/varnish4/varnish.config

exec /usr/sbin/varnishd $DAEMON_OPTS
