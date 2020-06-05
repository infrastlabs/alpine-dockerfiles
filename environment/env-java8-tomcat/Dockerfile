
ARG repo=docker.io
FROM ${repo}/infrastlabs/bin-aio:tomcat-v8.5.55 as bin
FROM ${repo}/infrastlabs/env-java8:jvms-v1.0
MAINTAINER sam <sldevsir@126.com>

USER root
RUN mkdir -p /data && useradd -m -d /data/www -s /bin/bash www
COPY --chown=www:www --from=bin /down/apache-tomcat-8.5.55 /data/www/app
ADD *.sh /
RUN sh /build.sh

##run as www
USER www
WORKDIR /
