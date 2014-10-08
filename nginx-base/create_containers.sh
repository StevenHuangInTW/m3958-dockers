#!/bin/bash

. ../functions

names=$(sn_logn_bcn_cn "" nginx)

#split string
na=(${names///})

docker run -d -v /var/log/nginx --name ${na[1]}  m3958/nginx echo ${na[1]}
docker run -d -v /m3958baseconfig  --name ${na[2]}  m3958/nginx echo ${na[2]}
docker run -d -v /etc/nginx  --name ${na[3]}  m3958/nginx echo ${na[3]}

docker run -d \
  --volumes-from ${na[1]} \
  --volumes-from ${na[2]} \
  --volumes-from ${na[3]} \
  --name ${na[0]} \
  m3958/nginx
