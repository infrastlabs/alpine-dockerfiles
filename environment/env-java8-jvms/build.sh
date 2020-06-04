#!/usr/bin/env bash

cat > /etc/source-openj9 <<EOF
#jdk8u202-b08
export JAVA_VERSION=jdk8u192-b12_openj9-0.11.0
export JAVA_HOME==/usr/local/soft/java/openjdk
export PATH="\$JAVA_HOME/bin:\$PATH"
export JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
EOF

cat > /etc/source-hotspot <<EOF
#hotspot-8u202
export JAVA_HOME==/usr/local/soft/java/jdk1.8.0_202
export PATH="\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH"
export JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"
EOF

##console
cat >> /etc/profile <<EOF

##jvm
if [ "openj9" = "\$APP_JVM" ]; then
  source /etc/source-openj9
else
  source /etc/source-hotspot
fi
EOF

rm -f /build.sh