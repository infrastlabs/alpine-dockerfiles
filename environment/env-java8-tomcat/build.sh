#!/usr/bin/env bash
dest=/data/www/app

## before COPY --chown=www:www
#RUN mkdir -p /data && useradd -m -d /data/www -s /bin/bash www

#bin
rm -f $dest/bin/*.bat
rm -rf $dest/webapps/ROOT/*
rm -rf $dest/webapps/{docs,examples,host-manager,manager}

#mkdir -p /tmp/zk-cache && chown www:www /tmp/zk-cache
cat > $dest/bin/setenv.sh <<EOF
APP_HOME=/data/www #/tmp/zk-cache
if [ ! "" = "\$APP_HOME" ]; then
  echo "setenv.sh: add env[app.home]"
  JAVA_OPTS="\$JAVA_OPTS -Dapp.home=\${APP_HOME}"
fi
EOF

#logs
rm -rf $dest/logs
#ln -s /data/www/log/$app_name ##in deploy.sh when start-run

#apollo
# mkdir -p /opt/data && chown www:www -R /opt/data

rm -f /build.sh
