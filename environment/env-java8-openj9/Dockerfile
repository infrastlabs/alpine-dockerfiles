    FROM adoptopenjdk/openjdk8-openj9:jdk8u252-b09_openj9-0.20.0-alpine-slim as openj9
ARG repo=docker.io
FROM ${repo}/infrastlabs/alpine-ext
MAINTAINER sam <sldevsir@126.com>

USER root
COPY --from=openj9 /opt/java/openjdk /usr/local/soft/java/openjdk

##run as root
USER root
WORKDIR /

#ENV JAVA_VERSION jdk8u192-b12_openj9-0.11.0
ENV JAVA_HOME=/usr/local/soft/java/openjdk \
    PATH="/usr/local/soft/java/openjdk/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
RUN echo "PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile