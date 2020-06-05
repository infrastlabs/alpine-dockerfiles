ARG repo=docker.io
FROM ${repo}/infrastlabs/env-java8:hotspot-8u202 as hotspot
FROM ${repo}/infrastlabs/env-java8:openj9-8u252 as openj9
FROM ${repo}/infrastlabs/env-java8:zulu-8u252 as zulu
# FROM registry.cn-shenzhen.aliyuncs.com/k-spe/top-alpine
FROM ${repo}/infrastlabs/alpine-ext:weak
MAINTAINER sam <sldevsir@126.com>

ENV APP_JVM=zulu
USER root
COPY --from=hotspot /usr/local/soft/java/jdk1.8.0_202 /usr/local/soft/java/jdk1.8.0_202
COPY --from=openj9 /usr/local/soft/java/openjdk /usr/local/soft/java/openjdk
COPY --from=zulu /usr/local/soft/java/zulujdk1.8.0_252 /usr/local/soft/java/zulujdk1.8.0_252

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /
