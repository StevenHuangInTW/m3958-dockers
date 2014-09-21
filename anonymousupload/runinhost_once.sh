#/bin/bash

tdir=/opt/dockerdata/anonymousupload

mkdir -p "$tdir/log/mongodb"
mkdir -p "$tdir/mongodb"

mkdir -p "$tdir/log/redis"
mkdir -p "$tdir/redis"

cp supervisord.conf  $tdir
cp redis.conf $tdir
cp mongodb.conf $tdir

cp addn-hosts $tdir
cp dnsmasq.conf $tdir

cp anonymousupload-0.0.5-mod.zip $tdir
