#!/usr/bin/env bash
echo "entry_params: $@"  #tini + gosu

# runDropbear #when $SSHD_ENABLE=true

#load env, ex: for env-java8:jvms-v1.0
#source /etc/profile

# /bin/bash
# exec $@ #trans exec
# exec tini "$@"

#scripts to run(www)
file2=/tmp/gosu-www.sh
cat > $file2 <<EOF
echo "params_www \$@"
source /etc/profile

#exec "\$@"
cmd=\$1
shift
exec \$cmd "\$@"
EOF
chmod +x $file2

#scripts to run (root)
file=/tmp/gosu-root.sh
cat > $file <<EOF
echo "params_root \$@"
runDropbear

# source /etc/profile
# exec "\$@"
# "\$@"

exec gosu www bash -c "$file2 $@" && rm -f $file2
# gsc drop #drop root's permision
EOF
chmod +x $file

# printf "\n>>gosu exec as root--------------------\n"
# gosu root tini -s bash -c "$file \"$@\"" && rm -f $file
exec gosu root bash -c "$file $@" && rm -f $file