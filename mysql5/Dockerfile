FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install mysql-server

ADD my.cnf /etc/my.cnf

ADD mysqldrun.sh /util/
ADD mysqlinitrun.sh /util/

RUN chmod +x /util/mysqldrun.sh
RUN chmod +x /util/mysqlinitrun.sh

EXPOSE 3306
