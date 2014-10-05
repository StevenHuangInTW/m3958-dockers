#!/bin/bash

. /opt/runningdir/varnish4/cfg/varnish.config

exec /usr/sbin/varnishd $DAEMON_OPTS
