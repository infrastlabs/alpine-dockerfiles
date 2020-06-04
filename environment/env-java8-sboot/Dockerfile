ARG repo=docker.io
FROM ${repo}/infrastlabs/env-java8-jvms
MAINTAINER sam <sldevsir@126.com>

USER root

ADD *.sh /
RUN sh /build.sh

##run as www
USER www
WORKDIR /
