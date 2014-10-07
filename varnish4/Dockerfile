FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD varnish4.repo /etc/yum.repos.d/varnish4.repo

RUN yum -y install varnish

ADD varnish4_run.sh /util/

RUN chmod a+x /util/varnish4_run.sh

ADD default.vcl /default.vcl
ADD varnish.config /varnish.config

EXPOSE 80
