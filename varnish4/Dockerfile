FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN  rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm

RUN yum -y install varnish

ADD varnish4_run.sh /
RUN chmod +x /varnish4_run.sh

RUN cp /etc/sysconfig/varnish /m3958dir/config/varnish.config

RUN cp -R /etc/varnish /m3958dir/config/

RUN sed -i "s#/etc/varnish#/m3958dir/config/varnish#" /m3958dir/config/varnish.config

RUN sed -i "s/\(VARNISH_LISTEN_PORT.*\)=.*/\1=80/" /m3958dir/config/varnish.config 

RUN echo "[program:varnish4]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/varnish4_run.sh" >> /m3958dir/config/supervisord.conf

EXPOSE 80

