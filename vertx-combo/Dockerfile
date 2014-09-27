FROM m3958/base

MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN yum -y install mongodb-server

RUN yum -y install redis

# application start

ADD vert.x-2.1.2.zip /vert.x.2.1.2.zip

RUN unzip /vert.x.2.1.2.zip

ADD runvertx.sh /runvertx.sh
RUN chmod +x /runvertx.sh

EXPOSE 22 80

