FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

#ADD varnish4.repo /etc/yum.repos.d/varnish4.repo
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

#for debug purpose

#RUN echo "[program:sshd]" >> /m3958dir/config/supervisord.conf
#RUN echo "command=/util/sshd_run.sh" >> /m3958dir/config/supervisord.conf
#
#RUN yum -y install openssh-server
#
#RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
#RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
#RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
#RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
