FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install mysql-server

RUN cp /etc/my.cnf /m3958dir/config
RUN mkdir /var/log/mysql
RUN sed -i "s/datadir=.*/datadir=\/m3958dir\/data/" /m3958dir/config/my.cnf
RUN sed -i "s/log-error=.*/log-error=\/var\/log\/mysql\/mysqld.log/" /m3958dir/config/my.cnf

RUN echo "[program:mysqld]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/mysqld_run.sh" >> /m3958dir/config/supervisord.conf

ADD mysqld_run.sh /
RUN chmod +x /mysqld_run.sh

ADD mysqld_initrun.sh /
RUN chmod +x /mysqld_initrun.sh

RUN /mysqld_initrun.sh

EXPOSE 3306

#debug into container
#then /mysqld_run.sh
#then mysql_secure_installation
#then create user for use.
