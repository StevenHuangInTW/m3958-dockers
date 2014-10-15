FROM centos:centos6
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install wget unzip vi telnet tar which bzip2

ADD http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm

RUN rpm -ivh /tmp/epel-release-6-8.noarch.rpm

RUN rm -rf /tmp/epel-release-6-8.noarch.rpm

RUN yum -y install dnsmasq

RUN yum -y install supervisor
RUN mkdir /util
RUN mkdir /m3958dir
RUN mkdir -p /m3958dir/data
RUN mkdir -p /m3958dir/config
RUN mkdir -p /m3958dir/log
RUN mkdir -p /m3958dir/supvervisordlog/childlog

RUN cp /etc/dnsmasq.conf /m3958dir/config/
RUN cp /etc/supervisord.conf /m3958dir/config/
RUN echo "# ip hostname" > /m3958dir/config/addn-hosts

RUN echo "addn-hosts=/m3958dir/config/addn-hosts" >> /m3958dir/config/dnsmasq.conf
RUN sed -i "s#;childlogdir.*#childlogdir=/m3958dir/supervisordlog/childlog#" /m3958dir/config/supervisord.conf


RUN echo "[program:dnsmasq]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/util/dnsmasq_run.sh" >> /m3958dir/config/supervisord.conf

ADD util /util
RUN chmod +x /util/*.sh

CMD ["/usr/bin/supervisord", "-n", "-c", "/m3958dir/config/supervisord.conf"]

RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

#RUN yum -y install perl perl-ExtUtils-MakeMaker perl-ExtUtils-Install perl-ExtUtils-Manifest perl-ExtUtils-ParseXS perl-ExtUtils-CBuilder perl-ExtUtils-Embed gcc
#
#RUN curl -L http://cpanmin.us | perl - App::cpanminus
#
#RUN cpanm Getopt::Long JSON Data::UUID
#RUN cpanm Catalyst::Devel

# if you create volume here, you will not able to change content in it.
# you must create a named data volume from this image, then share to others
# make change data persist.
 
#RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

