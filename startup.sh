#!/bin/sh

set -e

echo "/etc/turnserver.conf"
envsubst < /tmp/turnserver.conf > /etc/turnserver.conf
echo /etc/turnserver.conf

if [ ! -f /initialized ]; then
  if [ "$PUBLIC_IP" == "" ]; then
      PUBLIC_IP=$(curl http://icanhazip.com 2>/dev/null)
  fi
fi
touch /initialized
echo "Using public IP $PUBLIC_IP"

echo "Starting turnserver..."
turnserver -v -c /etc/turnserver.conf
