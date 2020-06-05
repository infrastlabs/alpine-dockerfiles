#!/usr/bin/env bash


# https://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz


url=http://172.25.23.190/repo3-env
AUTH=root:root
dest=/down

function down(){
  local src=$1
  curl -g -u $AUTH $url/$src > $src #-g with []
  mkdir -p $dest && tar -zxf $src -C $dest
  rm -f $src

  tree -L 2 $dest/  
}

#case > switch($TAG)
echo "TAG: $TAG"
cmd=`echo $TAG |cut -d'-' -f1`
echo "cmd: $cmd"

# hotspot, zulu, nexus, tomcat
case "$cmd" in
  # OpenJDK8U-jdk_x64_linux_openj9_8u252b09_openj9-0.20.0.tar.gz
  hotspot)
    down "jdk-8u202-linux-x64.tar.gz"
    ;;
  zulu)
    down "zulu8.46.0.19-ca-jdk8.0.252-linux_x64.tar.gz"
    ;;
  nexus)
    down "nexus-2.7.1-01-bundle_repack.tar.gz"
    ;;
  tomcat)
    down "apache-tomcat-8.5.55.tar.gz"
    ;;            
  all) #all in one?
    # $down jdk-8u162-linux-x64.tar.gz
    # $down zulu-xxx.tar.gz
    # $down nexus-2.7.1-01-bundle.tar.gz
    # $down apache-tomcat-8.0.51.tar.gz
    ;;
  *)
    echo "error: TAG preffix not mactch, please check you tag."
    exit 2
    ;;
esac

rm -f /build.sh