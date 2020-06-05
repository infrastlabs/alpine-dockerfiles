ARG repo=docker.io
FROM ${repo}/k-spe/top-jdk-openj9
MAINTAINER sam <sldevsir@126.com>

USER root
RUN mkdir /repository

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /