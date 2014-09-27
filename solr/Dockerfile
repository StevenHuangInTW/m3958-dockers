FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN curl -O http://mirrors.cnnic.cn/apache/lucene/solr/4.10.0/solr-4.10.0.tgz

RUN tar -zxf solr-4.10.0.tgz
RUN rm -f solr-4.10.0.tgz
RUN mv /solr-4.10.0/example/solr /solr-4.10.0/example/solrbak

ADD runsolr.sh /runsolr.sh
RUN chmod +x /runsolr.sh

EXPOSE 22 8983

