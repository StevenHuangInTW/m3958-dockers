FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

ADD varnish4.repo /etc/yum.repos.d/varnish4.repo

RUN yum -y install varnish

ADD runvarnish.sh /runvarnish.sh

RUN chmod a+x /runvarnish.sh

EXPOSE 22 80
