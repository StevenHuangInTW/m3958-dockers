FROM m3958/base:201401
MAINTAINER Libo Jiang <jianglibo@gmail.com>

#RUN curl -o piwik.zip http://upload.fh.gov.cn/5jsNsrK.zip
RUN curl -Lo piwik.zip http://builds.piwik.org/piwik.zip
RUN unzip piwik.zip
RUN rm -f piwik.zip 
RUN mkdir -p /www/html
RUN cp -R piwik/* /www/html/
RUN rm -rvf piwik
