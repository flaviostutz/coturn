#!/bin/sh

set -e

echo "/etc/turnserver.conf"
envsubst < /tmp/turnserver.conf > /etc/turnserver.conf
echo /etc/turnserver.conf

if [ ! -f "/public_ip" ]; then
  if [ "$PUBLIC_IP" == "" ]; then
      curl http://icanhazip.com 2>/dev/null > /external_ip
  else
      echo $PUBLIC_IP > /public_ip
  fi
fi

echo "Starting turnserver..."
turnserver -v --log-file stdout --external-ip `cat /public_ip` -c /etc/turnserver.conf
