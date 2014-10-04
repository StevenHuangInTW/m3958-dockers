#!/bin/bash

nginxlog=/opt/runningdir/nginxlog
duser=$(stat -c %U $nginxlog)

if [ ! $duser = "nginx" ]
then
  chown -R nginx:nginx $nginxlog
fi

exec /usr/sbin/nginx -c /opt/runningdir/nginx/nginx.conf
