FROM m3958/base

MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install mongodb-server

RUN yum -y install redis

ADD vert.x-2.1.2.zip /vert.x.2.1.2.zip

RUN unzip /vert.x.2.1.2.zip

ADD mongodb.conf /cfgdir/
ADD redis.conf /cfgdir/
ADD vertxinitrun.sh /util/

RUN chmod +x /util/vertxinitrun.sh
