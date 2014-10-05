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

ADD phpfpm_run.sh /
RUN chmod +x /phpfpm_run.sh

ADD phpfpm_initrun.sh /util/
RUN chmod +x /util/phpfpm_initrun.sh

ADD php-fpm.conf /
ADD www.conf /php-fpm-www.conf
ADD php.ini /

EXPOSE 9000
