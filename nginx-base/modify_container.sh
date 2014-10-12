#!/bin/bash

sed -i "s#/usr/share/nginx/html#/www/html#" /m3958dir/config/nginx/conf.d/default.conf

sed -i "s#/etc/nginx#/m3958dir/config/nginx#" /m3958dir/config/nginx/nginx.conf

sed -i "3a daemon off;" /m3958dir/config/nginx/nginx.conf

num=$(sed -n "/FastCGI/=" /m3958dir/config/nginx/conf.d/default.conf)
read content <<-YYYY
location ~\.php$ {
  root  /m3958dir/data
  fastcgi_pass
}
YYYY

