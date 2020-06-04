#!/usr/bin/env bash

#add user
mkdir -p /data
useradd -m -d /data/www -s /bin/bash www
#gosuctl add www in dtl-app-dockerfile

#init dir
chown -R www:www /data/www/
# mkdir -p /opt/appdata /data/www/{app,log}
# chown -R www:www /opt/appdata

#apollo
# mkdir -p /opt/data && chown www:www -R /opt/data

rm -f /build.sh