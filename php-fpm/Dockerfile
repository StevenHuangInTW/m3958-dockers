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
RUN echo "command=/usr/sbin/php-fpm -F -c /m3958dir/config/php.ini -y /m3958dir/config/php-fpm.conf" >> /m3958dir/config/supervisord.conf
RUN mkdir -p /www/html

# -e will cause \n to work.
RUN echo -e "<?php\nphpinfo();\n?>" > /www/html/index.php

RUN sed -i "s#/etc/#/m3958dir/config/#" /m3958dir/config/php-fpm.conf

RUN sed -i "s/listen.allowed/#listen.allowed/" /m3958dir/config/php-fpm.conf
RUN sed -i "s/listen = 127.0.0.1:/listen = /" /m3958dir/config/php-fpm.conf


EXPOSE 9000
