#/bin/bash

. containerinfo

tdir=${HOST_DIR}

if [ ! -d $tdir ]; then
  mkdir -p $tdir

  cp -R solr $tdir

  cp supervisord.conf  $tdir
  cp addn-hosts $tdir
  cp dnsmasq.conf $tdir

else
  echo "$tdir already exist."
fi


#curl -o http://mirrors.cnnic.cn/apache/lucene/solr/4.10.0/solr-4.10.0.tgz
#curl -o http://central.maven.org/maven2/org/apache/lucene/lucene-analyzers-common/4.10.0/lucene-analyzers-common-4.10.0.jar
