FROM centos:centos6
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install wget unzip vi telnet tar which

ADD http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm

RUN rpm -ivh /tmp/epel-release-6-8.noarch.rpm

RUN rm -rf /tmp/epel-release-6-8.noarch.rpm

RUN yum -y install dnsmasq

RUN yum -y install supervisor

RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

ADD cfgdir /cfgdir
ADD util /util
RUN chmod +x /util/*.sh

CMD ["/usr/bin/supervisord", "-c", "/opt/runningdir/supervisor.d/supervisord.conf"]
