FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN curl -o piwik.zip http://upload.fh.gov.cn/5jsNsrK.zip
RUN unzip piwik.zip
RUN rm -rvf piwik.zip

RUN yum -y install php php-fpm php-gd php-ldap \
    php-pear php-mysql \
    php-mcrypt php-xcache php-xml php-xmlrpc

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx

ADD runnginx.sh /runnginx.sh

RUN chmod a+x /runnginx.sh

EXPOSE 22 80



#RUN sed -i '/^listen/c \
#listen = 0.0.0.0:9000' /etc/php-fpm.d/www.conf
#
#RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf
#
#RUN mkdir -p /srv/http && \
#    echo "<?php phpinfo(); ?>" > /srv/http/index.php && \
#    chown -R apache:apache /srv/http
#
#EXPOSE 9000
#VOLUME /srv/http
#ENTRYPOINT ["php-fpm","-F"]

#

#user               nobody;
#worker_processes   8;
#error_log          /var/log/nginx/error.log   notice;
#pid                /var/run/nginx.pid;

#

#events {
#    worker_connections  1024;
#}

#

#http {
#    include       mime.types;
#    default_type  application/octet-stream;

#    log_format   main   '$remote_addr - $remote_user [$time_local] "$request" '
#                  '$status $body_bytes_sent "$http_referer" '
#                  '"$http_user_agent" "$http_x_forwarded_for"';
#    access_log  /var/log/nginx/access.log  main;
#    sendfile        on;
#    #tcp_nopush     on;
#    keepalive_timeout  65;

#
#    server {
#        listen        80;
#        server_name   hostname.servers.domain.net;
#    #    access_log    /var/log/nginx/access_logs/hostname.servers.domain.net.access.log   main;
#        access_log    off;
#        location / {
#            root    /var/www/_system/public/http;
#            index   index.php index.html index.htm;
#        #}

#        error_page   500 502 503 504  /50x.html;
#        location = /50x.html {
#            root   html;
#        #}

#	location ~ \.php$ {
#	    fastcgi_pass    127.0.0.1:9000;
#	    fastcgi_index   index.php;
#            fastcgi_param   SCRIPT_FILENAME   /var/www/_system/public/http$fastcgi_script_name;
#            fastcgi_param   PATH_INFO         $fastcgi_script_name;
#	    fastcgi_param   QUERY_STRING      $query_string;
#	    fastcgi_param   REQUEST_METHOD    $request_method;
#	    fastcgi_param   CONTENT_TYPE      $content_type;
#	    fastcgi_param   CONTENT_LENGTH    $content_length;
#            include         /etc/nginx/fastcgi_params;
        #}
#    #}

#

#    server {
#        listen        80;
#        server_name   test.domain.net;
##        access_log    /var/log/nginx/access_logs/nzstest.dev.creatim.net.access.log   main;

#        location / {
#            root    /var/www/nzstest.dev.creatim.net/public/http;
#
#            if (!-e $request_filename) {
#        	rewrite   ^(.+)$   /index.php   last;
#        	break;
            #}
#        #}

#	location ~ \.php$ {
#	    fastcgi_pass    127.0.0.1:9000;
#	    fastcgi_index   index.php;
#            fastcgi_param   SCRIPT_FILENAME   /var/www/test.domain.net/public/http$fastcgi_script_name;
#            fastcgi_param   PATH_INFO         $fastcgi_script_name;
#	    fastcgi_param   QUERY_STRING      $query_string;
#	    fastcgi_param   REQUEST_METHOD    $request_method;
#	    fastcgi_param   CONTENT_TYPE      $content_type;
#	    fastcgi_param   CONTENT_LENGTH    $content_length;
#            include         /etc/nginx/fastcgi_params;
        #}
    #}
}
