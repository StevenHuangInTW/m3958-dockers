#!/bin/bash

. /m3958dir/config/varnish.config

exec /usr/sbin/varnishd -F $DAEMON_OPTS
