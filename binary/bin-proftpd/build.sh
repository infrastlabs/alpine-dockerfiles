#!/usr/bin/env bash


# url=http://172.25.23.190/repo3-env
# AUTH=root:root
dest=/down

function down(){
  local url=$1
  local file=${url##*/}
  mkdir -p $dest
  curl -g $url > $dest/$file #-g with []

  # mkdir -p $dest && tar -zxf $src -C $dest
  # rm -f $src
  # tree -L 2 $dest/  
}

# proftpd
down ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.6d.tar.gz
down ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.7rc4.tar.gz


rm -f /build.sh