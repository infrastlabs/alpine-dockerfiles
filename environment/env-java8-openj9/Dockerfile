ARG repo=docker.io
FROM adoptopenjdk/openjdk8-openj9:jdk8u252-b09_openj9-0.20.0-alpine-slim as openj9
FROM ${repo}/infrastlabs/alpine-ext:weak
MAINTAINER sam <sldevsir@126.com>
# ARG src=jdk-8u202-linux-x64.tar.gz
ARG dest=/usr/local/soft/java

USER root
COPY --from=openj9 /opt/java/openjdk $dest/openjdk

# ADD *.sh /
# RUN sh /build.sh

##run as root
USER root
WORKDIR /

#ENV JAVA_VERSION jdk8u192-b12_openj9-0.11.0
ARG jhome=$dest/openjdk
ENV JAVA_HOME=$jhome \
    PATH="$jhome/bin:$jhome/jre/bin:$PATH"
RUN echo "PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH" >> /etc/profile \
  && source /etc/profile && java -version
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"