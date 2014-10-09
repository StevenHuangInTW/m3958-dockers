FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

#ADD varnish4.repo /etc/yum.repos.d/varnish4.repo
RUN  rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm

RUN yum -y install varnish

ADD varnish4_run.sh /
RUN chmod +x /varnish4_run.sh

RUN cp /etc/sysconfig/varnish /m3958dir/config/varnish.config

RUN cp -R /etc/varnish /m3958dir/config/

RUN echo "[program:varnish4]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/varnish4_run.sh" >> /m3958dir/config/supervisord.conf

#ADD varnish4_run.sh /
#
#RUN chmod +x /varnish4_run.sh
#
#ADD default.vcl /default.vcl
#ADD varnish.config /varnish.config

EXPOSE 80
