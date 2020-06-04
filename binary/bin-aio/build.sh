#!/usr/bin/env bash


url=http://10.1.1.114:680/temp_trans/pro_env
dest=/down

function down(){
  local src=$1
  wget --user=root --password=root $url/$src
  mkdir -p $dest && tar -zxf $src -C $dest
  rm -f $src  
}

#TODO case > switch($tag)
# hotspot, zulu, nexus, tomcat
src=jdk-8u162-linux-x64.tar.gz
$down $src

src=zulu-xxx.tar.gz
$down $src

src=nexus-2.7.1-01-bundle.tar.gz
$down $src

src=apache-tomcat-8.0.51.tar.gz
$down $src


rm -f /build.sh