ARG repo=docker.io
FROM ${repo}/infrastlabs/env-java8-openj9 as openj9
FROM ${repo}/infrastlabs/env-java8-hotspot as hotspot
FROM ${repo}/infrastlabs/env-java8-zulu as zulu
# FROM registry.cn-shenzhen.aliyuncs.com/k-spe/top-alpine
FROM registry.cn-shenzhen.aliyuncs.com/infrastlabs/alpine-ext:weak
MAINTAINER sam <sldevsir@126.com>

ENV APP_JVM=openj9
USER root
COPY --from=openj9 /usr/local/soft/java/openjdk /usr/local/soft/java/openjdk
COPY --from=hotspot /usr/local/soft/java/jdk1.8.0_202 /usr/local/soft/java/jdk1.8.0_202

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /


