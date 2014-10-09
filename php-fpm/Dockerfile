FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install \
    php \
    php-fpm \
    php-gd \
    php-pear \
    php-mysql \
    php-mcrypt \
    php-xcache \
    php-xml \
    php-xmlrpc \
    php-mbstring \
    php-curl

# if possible,move config to /m3958dir/config
# php.ini is not relate to /etc/php.d

RUN cp /etc/php-fpm.conf /m3958dir/config/
RUN cp -R /etc/php-fpm.d /m3958dir/config/
RUN cp /etc/php.ini /m3958dir/config/


RUN echo "[program:php-fpm]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/usr/sbin/php-fpml -D -c /m3958dir/config/php.ini -y /m3958dir/config/php-fpm.conf" >> /m3958dir/config/supervisord.conf
RUN mkdir -p /www/html

RUN echo "<?php\nphpinfo();\n?>" > /www/html/index.php

RUN sed -i "s#/etc/#/m3958dir/config/#" /m3958dir/config/php-fpm.conf

#ADD phpfpm_run.sh /
#RUN chmod +x /phpfpm_run.sh
#
#ADD phpfpm_initrun.sh /util/
#RUN chmod +x /util/phpfpm_initrun.sh
#
#ADD php-fpm.conf /
#ADD www.conf /
#ADD php.ini /

EXPOSE 9000
