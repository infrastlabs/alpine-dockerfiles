#!/usr/bin/env bash

#add user, gsc
mkdir -p /data
useradd -m -d /data/www -s /bin/bash www

#chpasswd: generate one when build
# erpasswd root
# erpasswd entry
# erpasswd www

#init dir
chown -R www:www /data/www/
# mkdir -p /opt/appdata /data/www/{app,log}
# chown -R www:www /opt/appdata

#apollo
# mkdir -p /opt/data && chown www:www -R /opt/data

#gosuctl: root's permision for www
gsc add www #gosu 
apk add tini

rm -f /build.sh