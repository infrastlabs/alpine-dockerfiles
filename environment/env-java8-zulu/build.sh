#!/usr/bin/env bash
src=zulu-8u252-linux-x64.tar.gz
dest=/usr/local/soft/java

#wget --user=root --password=root http://10.1.1.114:680/temp_trans/pro_env/$src
#mkdir -p $dest && tar -zxf $src -C $dest
#rm -f $src

###ENV
echo "set /etc/profile JAVA_ENV"
cat >>/etc/profile<<EOF
JAVA_HOME=$dest/zulu_8u252
CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar

PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH
export JAVA_HOME CLASSPATH PATH
EOF

ln -s $dest/zulu_8u252 /usr/local/java

#ENV JAVA_HOME=$dest/zulu_8u252 \
#    PATH="$dest/zulu_8u252/bin:$PATH"
#TODO tobeTest: JAVA_TOOL_OPTIONS
#ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"

rm -f /build.sh