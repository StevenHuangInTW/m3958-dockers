FROM centos:centos6
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install wget unzip vi telnet tar which

ADD http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm

RUN rpm -ivh /tmp/epel-release-6-8.noarch.rpm

RUN rm -rf /tmp/epel-release-6-8.noarch.rpm

RUN yum -y install dnsmasq

RUN yum -y install supervisor

RUN mkdir /m3958baseconfig
ADD dnsmasq.conf /m3958baseconfig/
ADD supervisord.conf /m3958baseconfig/
ADD addn-hosts /m3958baseconfig/

CMD ["/usr/bin/supervisord", "-c", "/m3958baseconfig/supervisord.conf"]

# if you create volume here, you will not able to change content in it.
# you must create a named data volume from this image, then share to others
# make change data persist.
 
#VOLUME [/m3958baseconfig]

#RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

#ADD cfgdir /cfgdir
#ADD util /util
#RUN chmod +x /util/*.sh
#RUN echo "#/bin/bash" > /run_container.sh
#RUN chmod +x /run_container.sh
#CMD /run_container.sh
