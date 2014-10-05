FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install mysql-server

ADD my.cnf /etc/my.cnf

ADD mysqld_run.sh /
ADD mysqld_initrun.sh /util/

RUN chmod +x /mysqld_run.sh
RUN chmod +x /util/mysqld_initrun.sh

EXPOSE 3306
