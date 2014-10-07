FROM m3958/vertxbase:212
MAINTAINER Libo Jiang <jianglibo@gmail.com>

ADD anonymousupload_run.sh /
RUN chmod +x /anonymousupload_run.sh

ADD anonymousupload_initrun.sh  /util/
RUN chmod +x /util/anonymousupload_initrun.sh

ADD anonymousupload-0.0.5-mod.zip /
ADD conf.json /anonymousupload.conf.json

EXPOSE 80

