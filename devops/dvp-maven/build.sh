#!/usr/bin/env bash

MAVEN_VERSION=3.5.4

# Add User
useradd -m -d /home/jenkins -s /bin/bash jenkins

# Install GIT
apk add --no-cache git lftp

# Install Maven
wget -q http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
    mkdir /usr/local/soft/maven
    tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/local/soft/maven
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz
ln -s /usr/local/soft/maven/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn

# Test
mvn -v

# env
#ln -s /home/jenkins/.netrc /root/.netrc ##/home/jenkins

#conf
mvn_cnf="/usr/local/soft/maven/apache-maven-${MAVEN_VERSION}/conf"
# mv $mvn_cnf/settings.xml $mvn_cnf/settings.xml00
# ln -s /somedir/settings.xml $mvn_cnf/settings.xml

rm -f /build.sh