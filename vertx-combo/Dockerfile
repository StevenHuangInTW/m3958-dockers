FROM m3958/vertxbase:212
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD vertxcomborun.sh /
RUN chmod +x /vertxcomborun.sh
ADD vertxcombo-0.0.3-mod.zip /
ADD conf.json /vertxcombo.conf.json
ADD vertxcombo_initrun.sh  /util/

RUN chmod +x /util/vertxcombo_initrun.sh

EXPOSE 80

