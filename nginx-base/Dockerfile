FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx
RUN echo "[program:nginx]" >> /m3958baseconfig/supervisord.conf
RUN echo "command=/usr/sbin/nginx" >> /m3958baseconfig/supervisord.conf
RUN mkdir -p /www
RUN cp -R /usr/share/nginx/html /www/
RUN sed -i "s#/usr/share/nginx/html#/www/html#" /etc/nginx/conf.d/default.conf

EXPOSE 80

# to cutomize this container, we must create 4 volumes,
# nginx-base-config-vol -> /m3958baseconfig
# nginx-log-vol, -> /var/log/nginx
# nginx-config-vol -> /etc/nginx
# piwik-source-nginx-data-vol -> /usr/share/nginx/html

#ADD nginx_default.conf /nginx_default.conf
#ADD nginx.conf /nginx.conf
#
#ADD nginx_run.sh /nginx_run.sh
#RUN chmod +x /nginx_run.sh
#
#ADD nginx_initrun.sh /util/
#RUN chmod +x /util/nginx_initrun.sh
#
