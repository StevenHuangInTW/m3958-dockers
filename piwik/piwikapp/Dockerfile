FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN curl -o piwik.zip http://upload.fh.gov.cn/5jsNsrK.zip
RUN unzip piwik.zip
RUN rm -rvf piwik.zip

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

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx

ADD runnginx.sh /runnginx.sh
RUN chmod a+x /runnginx.sh

ADD runphpfpm.sh /runphpfpm.sh
RUN chmod a+x /runphpfpm.sh

EXPOSE 22 80
