#!/bin/bash

rdir=/opt/runningdir
duser=$(stat -c %U $rdir/piwik)

if [ ! $duser = "apache" ]; then
  chown -R apache:apache $rdir/piwik
  chmod -R 0755 $rdir/piwik/tmp
  chmod -R 0755 $rdir/piwik/tmp/assets/
  chmod -R 0755 $rdir/piwik/tmp/cache/
  chmod -R 0755 $rdir/piwik/tmp/logs/
  chmod -R 0755 $rdir/piwik/tmp/tcpdf/
  chmod -R 0755 $rdir/piwik/tmp/templates_c/
fi

exec /usr/sbin/php-fpm -y $rdir/php-fpm/php-fpm.conf -c $rdir/php-fpm/php.ini -F

#Usage: php [-n] [-e] [-h] [-i] [-m] [-v] [-t] [-p <prefix>] [-g <pid>] [-c <file>] [-d foo[=bar]] [-y <file>] [-D] [-F]
#  -c <path>|<file> Look for php.ini file in this directory
#  -n               No php.ini file will be used
#  -d foo[=bar]     Define INI entry foo with value 'bar'
#  -e               Generate extended information for debugger/profiler
#  -h               This help
#  -i               PHP information
#  -m               Show compiled in modules
#  -v               Version number
#  -p, --prefix <dir>
#                   Specify alternative prefix path to FastCGI process manager (default: /usr).
#  -g, --pid <file>
#                   Specify the PID file location.
#  -y, --fpm-config <file>
#                   Specify alternative path to FastCGI process manager config file.
#  -t, --test       Test FPM configuration and exit
#  -D, --daemonize  force to run in background, and ignore daemonize option from config file
#  -F, --nodaemonize
#                   force to stay in foreground, and ignore daemonize option from config file
#  -R, --allow-to-run-as-root
                   Allow pool to run as root (disabled by default)
