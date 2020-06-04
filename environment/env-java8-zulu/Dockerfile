ARG repo=docker.io
FROM ${repo}/infrastlabs/bin-aio:zulu-8u252
MAINTAINER sam <sldevsir@126.com>
ARG src=jdk-8u162-linux-x64.tar.gz
ARG dest=/usr/local/soft/java

USER root
#RUN wget --user=root --password=root http://10.1.1.114:680/temp_trans/pro_env/$src \
#    && mkdir -p $dest && tar -zxf $src -C $dest \
#    && rm -f $src

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /

ENV JAVA_HOME=$dest/jdk1.8.0_162 \
    PATH="$dest/jdk1.8.0_162/bin:$dest/jdk1.8.0_162/jre/bin:$PATH"

#
ENV JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

