#!/usr/bin/env bash
src=jdk-8u202-linux-x64.tar.gz
dest=/usr/local/soft/java

#wget --user=root --password=root http://10.1.1.114:680/temp_trans/pro_env/$src
#mkdir -p $dest && tar -zxf $src -C $dest
#rm -f $src

###ENV
echo "set /etc/profile JAVA_ENV"
cat >>/etc/profile<<EOF
JAVA_HOME=$dest/jdk1.8.0_202
CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar

PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH
export JAVA_HOME CLASSPATH PATH
EOF

ln -s $dest/jdk1.8.0_202 /usr/local/java

#ENV JAVA_HOME=$dest/jdk1.8.0_202 \
#    PATH="$dest/jdk1.8.0_202/bin:$PATH"
#TODO tobeTest: JAVA_TOOL_OPTIONS
#ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"

rm -f /build.sh