ARG repo=docker.io
FROM ${repo}/infrastlabs/bin-aio:zulu-8u252 as bin
FROM ${repo}/infrastlabs/alpine-ext:weak
MAINTAINER sam <sldevsir@126.com>
# ARG src=jdk-8u162-linux-x64.tar.gz
ARG dest=/usr/local/soft/java

USER root
COPY --from=bin /down/zulu8.46.0.19-ca-jdk8.0.252-linux_x64 $dest/zulujdk1.8.0_252

# ADD *.sh /
# RUN sh /build.sh

##run as root
USER root
WORKDIR /


ARG jhome=$dest/zulujdk1.8.0_252
ENV JAVA_HOME=$jhome \
    PATH="$jhome/bin:$jhome/jre/bin:$PATH"
RUN echo "PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH" >> /etc/profile \
  && source /etc/profile && java -version
# ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport"