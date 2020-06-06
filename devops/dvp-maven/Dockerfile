ARG repo=docker.io
FROM ${repo}/infrastlabs/env-java8:jvms-v1.0
MAINTAINER sam <sldevsir@126.com>

ENV APP_JVM=hotspot
USER root
# RUN mkdir /repository

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /