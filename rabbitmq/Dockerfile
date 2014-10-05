FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN yum -y install erlang
RUN curl -O http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.5/rabbitmq-server-3.3.5-1.noarch.rpm

RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

RUN yum -y install rabbitmq-server-3.3.5-1.noarch.rpm

ADD rabbitmq-env.conf /etc/rabbitmq/

ADD rabbitmq_run.sh /util/
RUN chmod +x /util/rabbitmq_run.sh

ADD rabbitmq_initrun.sh /util/
RUN chmod +x /util/rabbitmq_initrun.sh


ADD rabbitmq.config /

EXPOSE 5672

#[{rabbitmq_management,
#  [{listener, [{port, 15672},
#               {ip, "127.0.0.1"}
#              ]}
#  ]}
#]
