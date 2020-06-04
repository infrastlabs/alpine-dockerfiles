FROM registry.cn-shenzhen.aliyuncs.com/k-pub/app-bindata:bd-tomcat as src

ARG repo=docker.io
FROM ${repo}/infrastlabs/env-java8-jvms
MAINTAINER sam <sldevsir@126.com>

USER root
RUN mkdir -p /data && useradd -m -d /data/www -s /bin/bash www
COPY --chown=www:www --from=src /down/apache-tomcat-8.0.51 /data/www/app
ADD *.sh /
RUN sh /build.sh

##run as www
USER www
WORKDIR /
