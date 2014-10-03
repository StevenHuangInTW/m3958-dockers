FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>


ADD http://mirrors.cnnic.cn/apache/lucene/solr/4.10.1/solr-4.10.1.tgz /

RUN mkdir /sharedLib

RUN cp /solr-4.10.1/contrib/analysis-extras/lucene-libs/* /sharedLib

ADD solr_run.sh /solr_run.sh
RUN chmod +x /solr_sh.sh

EXPOSE 8983

