#!/usr/bin/env bash

# JAVA_TOOL_OPTIONS https://github.com/AdoptOpenJDK/openjdk-docker/blob/master/8/jdk/alpine/Dockerfile.openj9.releases.slim
# export JAVA_VERSION=jdk8u192-b12_openj9-0.11.0
cat > /etc/source-openj9 <<EOF
#openj9-8u252
export JAVA_HOME=/usr/local/soft/java/openjdk
export PATH="\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH"
export JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
EOF

cat > /etc/source-hotspot <<EOF
#hotspot-8u202
export JAVA_HOME=/usr/local/soft/java/jdk1.8.0_202
export PATH="\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH"
export JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"
EOF

cat > /etc/source-zulu <<EOF
#zulu-8u252
export JAVA_HOME=/usr/local/soft/java/zulujdk1.8.0_252
export PATH="\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH"
export JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport"
EOF

#console
cat >> /etc/profile <<EOF

case "\$APP_JVM" in
  hotspot)
    source /etc/source-hotspot
    ;;
  openj9)
    source /etc/source-openj9
    ;;
  zulu)
    source /etc/source-zulu
    ;;
  *) #default
    source /etc/source-hotspot
    ;;
esac
EOF

#Test
line="------------------------------"
source /etc/profile && java -version #zulu
echo "hotspot[default]: "$line
unset APP_JVM
source /etc/profile && java -version #default
echo "openj9: "$line
export APP_JVM=openj9
source /etc/profile && java -version #openj9

rm -f /build.sh