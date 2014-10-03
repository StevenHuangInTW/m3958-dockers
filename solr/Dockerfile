FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

# if add file from url, it will not auto extract.
#ADD http://mirrors.cnnic.cn/apache/lucene/solr/4.10.1/solr-4.10.1.tgz /
#RUN tar -zxvf /solr-4.10.1.tgz

ADD solr-4.10.1.tgz /

RUN mkdir /sharedLib

RUN cp solr-4.10.1/contrib/analysis-extras/lucene-libs/* /sharedLib

ADD solr_run.sh /util/
RUN chmod +x /util/solr_run.sh

ADD schema.xml /solr_cfg/
ADD solr.xml /solr_cfg/

EXPOSE 8983

ADD solr_initrun.sh /util/
RUN chmod +x /util/solr_initrun.sh
