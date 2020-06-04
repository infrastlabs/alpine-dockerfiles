ARG repo=docker.io
FROM ${repo}/infrastlabs/alpine-ext

ARG url=http://10.1.1.114:680/temp_trans/pro_env
ARG src=jdk-8u162-linux-x64.tar.gz
ARG dest=/down
#/jdk-8u162

USER root
RUN wget --user=root --password=root $url/$src \
    && mkdir -p $dest && tar -zxf $src -C $dest \
    && rm -f $src



