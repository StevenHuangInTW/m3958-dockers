FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx

ADD nginx_default.conf /nginx_default.conf
ADD nginx.conf /nginx.conf

ADD nginx_run.sh /nginx_run.sh
RUN chmod +x /nginx_run.sh

ADD nginx_initrun.sh /util/
RUN chmod +x /util/nginx_initrun.sh

EXPOSE 80
