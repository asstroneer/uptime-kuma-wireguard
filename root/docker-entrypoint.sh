#!/bin/bash

FILE=/etc/wireguard/wg0.conf

if [ -f "$FILE" ]; then
  echo "Wireguard config found. Restarting...\n"
  chmod 600 /etc/wireguard/wg0.conf
  wg-quick down wg0;
  wg-quick up wg0;
  echo "Wireguard client started.\n"
else
  echo "Wireguard config not found. Skipping...\n"
fi

cd /app; node server/server.js