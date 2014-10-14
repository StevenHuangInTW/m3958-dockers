FROM centos:centos6
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install wget unzip vi telnet tar which vim

ADD http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm

RUN rpm -ivh /tmp/epel-release-6-8.noarch.rpm

RUN rm -rf /tmp/epel-release-6-8.noarch.rpm

RUN yum -y install git

ADD enhancemyvim.sh /
RUN chmod +x /enhancemyvim.sh
RUN /enhancemyvim.sh

# if you create volume here, you will not able to change content in it.
# you must create a named data volume from this image, then share to others
# make change data persist.
 
#RUN yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64

