FROM m3958/base
MAINTAINER Libo Jiang <jianglibo@gmail.com>

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN yum -y install erlang
RUN curl -O http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.5/rabbitmq-server-3.3.5-1.noarch.rpm

RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

RUN yum -y install rabbitmq-server-3.3.5-1.noarch.rpm

ADD rabbitmq-env.conf /etc/rabbitmq/
ADD runrabbitmq.sh /

RUN chmod +x /runrabbitmq.sh

EXPOSE 22 5672

#[{rabbitmq_management,
#  [{listener, [{port, 15672},
#               {ip, "127.0.0.1"}
#              ]}
#  ]}
#]
