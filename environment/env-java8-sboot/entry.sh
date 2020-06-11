#!/usr/bin/env bash
#echo $@  #tini + gosu

# runDropbear #when $SSHD_ENABLE=true

#load env, ex: for env-java8:jvms-v1.0
source /etc/profile

# /bin/bash
# exec $@ #trans exec
# exec tini "$@"

#scripts to run(www)
file2=/tmp/gosu-root.sh
cat > $file2 <<EOF
echo "params_www $@"
EOF
chmod +x $file

#scripts to run (root)
file=/tmp/gosu-root.sh
cat > $file <<EOF
echo "params_root $@"
runDropbear

# gosu www bash -c $file2 && rm -f $file2
# gsc drop #drop root's permision
EOF
chmod +x $file

printf "\n>>gosu exec as root--------------------\n"
gosu root tini bash -c "$file \"$@\"" && rm -f $file
