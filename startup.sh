#!/bin/sh

set -e

if [ "$PUBLIC_IP" == "" ]; then
    export PUBLIC_IP=$(curl http://icanhazip.com 2>/dev/null)
fi
echo "Using public IP $PUBLIC_IP"

echo "/etc/turnserver.conf"
envsubst < /tmp/turnserver.conf > /etc/turnserver.conf
echo /etc/turnserver.conf

echo "Starting turnserver..."
turnserver -v -c /etc/turnserver.conf
