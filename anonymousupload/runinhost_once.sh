#/bin/bash

tdir=/opt/dockerdata/anonymousupload

mkdir -p $tdir
cp supervisord.conf  $tdir
cp redis.conf $tdir
cp mongodb.conf $tdir

cp addn-hosts $tdir
cp dnsmasq.conf $tdir

cp anonymousupload-0.0.5-mod.zip $tdir
