FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>


ADD http://mirrors.cnnic.cn/apache/lucene/solr/4.10.1/solr-4.10.1.tgz /

RUN mkdir /sharedLib

RUN cp /solr-4.10.1/contrib/analysis-extras/lucene-libs/* /sharedLib

ADD solr_run.sh /util/
RUN chmod +x /util/solr_sh.sh

ADD schema.xml /solr_cfg/
ADD solr.xml /solr_cfg/

EXPOSE 8983

