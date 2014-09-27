#/bin/bash

tdir=/opt/dockerdata/solr

if [ ! -d $tdir ]; then
  mkdir -p $tdir
  cp lucene-analyzers-common-4.10.0.jar $tdir
  cp supervisord.conf  $tdir
  cp redis.conf $tdir
  cp mongodb.conf $tdir

  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi

#mannuly execute following command, tar -zxvf, then copy to tdir.

#curl -o http://mirrors.cnnic.cn/apache/lucene/solr/4.10.0/solr-4.10.0.tgz
#curl -o http://central.maven.org/maven2/org/apache/lucene/lucene-analyzers-common/4.10.0/lucene-analyzers-common-4.10.0.jar
# cp solrschema4100.xml
