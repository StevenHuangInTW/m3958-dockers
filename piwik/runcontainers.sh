#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

if [ -z "$1" ]; then
  echo "please add action parameter:init,start,stop,editconfig"
  exit 0
fi
. ../functions

piwikvolname=piwik-php-files-vol

if [ ! "yes" = "$(container_exist ${piwikvolname})" ]; then
 docker run -d -v /www/html \
   --name $piwikvolname \
   m3958/piwik:2.7.0 \
   echo $piwikvolname
fi


act_nginx () {
/bin/bash ../ctrl-containers.sh \
  --action=$1 \
  --appname=piwik \
  --logpath=/var/log/nginx \
  --servicename=nginx \
  --imgname=m3958/nginx \
  --has-supervisord-log \
  -p 8080:80 \
  --link=piwik-php-fpm-service:piwik-php-fpm-service \
  --volumes-from=$piwikvolname
}

act_phpfpm () {
/bin/bash ../ctrl-containers.sh \
  --action=$1 \
  --appname=piwik \
  --logpath=/var/log/php-fpm \
  --has-supervisord-log \
  --servicename=php-fpm \
  --imgname=m3958/php-fpm \
  --link=piwik-mysql5-service:piwik-mysql5-service \
  --volumes-from=$piwikvolname
}

act_mysql () {
/bin/bash ../ctrl-containers.sh \
  --action=$1 \
  --appname=piwik \
  --logpath=/var/log/mysql \
  --servicename=mysql5 \
  --has-supervisord-log \
  --has-datavol \
  --imgname=m3958/mysql:5.1.73 
}

case "$1" in
  editconfig)
    echo "use edit_nginx_config or edit_phpfpm_config or edit_mysql_config";;
  viewlog)
    echo "use view_nginx_log or view_phpfpm_log or view_mysql_log";;
  debug)
    echo "use debug_nginx or debug_phpfpm or debug_mysql";;
  edit_nginx_config)
    act_nginx editconfig;;
  edit_phpfpm_config)
    act_phpfpm editconfig;;
  edit_mysql_config)
    act_mysql editconfig;;
  view_nginx_log)
    act_nginx viewlog;;
  view_phpfpm_log)
    act_phpfpm viewlog;;
  debug_nginx)
    act_nginx debug;;
  debug_mysql)
    act_mysql debug;;
  debug_phpfpm)
    act_phpfpm debug;;
  start-mysql)
    act_mysql "start";;
  init-mysql)
    act_mysql "init";;
  *)
    act_mysql $1
    act_phpfpm $1 
    act_nginx $1
    ;;
esac

popd >/dev/null
