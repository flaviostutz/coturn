#!/bin/sh

set -e

if [ "$PUBLIC_IP" == "" ]; then
    export PUBLIC_IP=$(curl http://icanhazip.com 2>/dev/null)
fi
echo "Using public IP $PUBLIC_IP"

echo "/etc/turnserver.conf"
envsubst < /tmp/turnserver.conf > /etc/turnserver.conf
echo /etc/turnserver.conf

if [ "$TURN_USERNAME" == "" ] && [ "$TURN_PASSWORD" == "" ]; then
    echo "WARNING: Allowing anonymous access to TURN server"
    sed -i 's/lt-cred-mech/#lt-cred-mech/g' /etc/turnserver.conf
    sed -i 's/#no-auth/no-auth/g' /etc/turnserver.conf
fi

echo /etc/turnserver.conf
cat /etc/turnserver.conf
echo ""

echo "Starting turnserver..."
turnserver -v -c /etc/turnserver.conf
