FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx

RUN echo "[program:nginx]" >> /m3958dir/config/supervisord.conf
RUN echo "command=/usr/sbin/nginx -c /m3958dir/config/nginx/nginx.conf" >> /m3958dir/config/supervisord.conf
RUN mkdir -p /www
RUN cp -R /usr/share/nginx/html /www/

RUN cp -R /etc/nginx /m3958dir/config/

RUN sed -i "s#/usr/share/nginx/html#/www/html#" /m3958dir/config/nginx/conf.d/default.conf

RUN sed -i "s#/etc/nginx#/m3958dir/config/nginx#" /m3958dir/config/nginx/nginx.conf

RUN sed -i "3a daemon off;" /m3958dir/config/nginx/nginx.conf

EXPOSE 80

# nginx usally link to backend, so change /m3958dir/config/nginx/conf.d/default.conf is a common action.
