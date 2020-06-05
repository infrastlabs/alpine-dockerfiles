ARG repo=docker.io
FROM ${repo}/infrastlabs/bin-aio:hotspot-8u202 as bin
FROM ${repo}/infrastlabs/alpine-ext:weak
MAINTAINER sam <sldevsir@126.com>
# ARG src=jdk-8u202-linux-x64.tar.gz
ARG dest=/usr/local/soft/java

USER root
COPY --from=bin /down/jdk1.8.0_202 $dest/jdk1.8.0_202

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /

ARG jhome=$dest/jdk1.8.0_202
ENV JAVA_HOME=$jhome \
    PATH="$jhome/bin:$jhome/jre/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

