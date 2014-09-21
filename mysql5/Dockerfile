FROM centos:centos6
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install wget unzip vi telnet tar which

ADD http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm

RUN rpm -ivh /tmp/epel-release-6-8.noarch.rpm

RUN rm -rf /tmp/epel-release-6-8.noarch.rpm

RUN yum -y install openssh-server

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

ADD set_root_pw.sh /set_root_pw.sh

ADD runsshd.sh /runsshd.sh

RUN chmod +x /*.sh

RUN yum -y install dnsmasq

RUN yum -y install supervisor

CMD ["/usr/bin/supervisord", "-c", "/opt/runningdir/supervisord.conf"]

# minify centos end.

RUN yum -y install mysql-server

ADD my.cnf /etc/my.cnf

ADD runmysql.sh /runmysqld.sh

RUN chomd +x /runmysqld.sh

EXPOSE 22 3306
