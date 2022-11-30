#!/bin/sh

USER=$(cat /run/secrets/vpn_user)
PASSWORD=$(cat /run/secrets/vpn_password)

echo "Starting VPN"
echo $PASSWORD | openconnect --protocol=$PROTOCOL -u $USER --passwd-on-stdin --background $ENDPOINT

sleep 2

echo "Creating Masquerade Rule"
iptables -I POSTROUTING -t nat -o tun0 -j MASQUERADE

echo "Starting recursive DNS Server"
dnsmasq -d


