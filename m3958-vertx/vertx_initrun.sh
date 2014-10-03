#!/bin/bash

#because m3958/base alreay put base_initrun.sh in /util/ folder.

/util/base_initrun.sh

ssconf=/opt/runningdir/supervisor.d/supervisord.conf

if [ -z $(cat ${ssconf}|grep "program:mongod") ]; then
  echo "[program:mongod]" >> $ssconf
  echo "command=/usr/bin/mongod --quiet -f /opt/runningdir/mongo_cfg/mongodb.conf" >> $ssconf
fi

if [ -z $(cat ${ssconf}|grep "program:redis") ]; then
  echo "[program:redis]" >> $ssconf
  echo "command=/usr/sbin/redis-server /opt/runningdir/redis_cfg/redis.conf" >> $ssconf
fi

rdr=/opt/runningdir
mongo_datadir=${rdr}/mongo_data
mongo_logdir=${rdr}/mongo_log
redis_datadir=${rdr}/redis_data
redis_logdir=${rdr}/redis_log
mongo_cfgdir=${rdr}/mongo_cfg
redis_cfgdir=${rdr}/redis_cfg

if [ ! -e "$mongo_datadir" ]; then
  mkdir "$mongo_datadir"
  chown -R mongodb:mongodb "$mongo_datadir"
fi

if [ ! -e "$mongo_logdir" ]; then
  mkdir "$mongo_logdir"
  chown -R mongodb:mongodb "$mongo_logdir"
fi

if [ ! -e "$mongo_cfgdir" ]; then
  mkdir "$mongo_cfgdir"
  cp /cfgdir/mongodb.conf "${mongo_cfgdir}/"
  chown -R mongodb:mongodb "$mongo_cfgdir"
fi

if [ ! -e "$redis_datadir" ]; then
  mkdir "$redis_datadir"
  chown -R redis:redis "$redis_datadir"
fi

if [ ! -e "$redis_logdir" ]; then
  mkdir "$redis_logdir"
  chown -R redis:redis "$redis_logdir"
fi

if [ ! -e "$redis_cfgdir" ]; then
  mkdir "$redis_cfgdir"
  cp /cfgdir/redis.conf "${redis_cfgdir}/"
  chown -R redis:redis "$redis_cfgdir"
fi

