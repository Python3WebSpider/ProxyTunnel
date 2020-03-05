#!/bin/sh
echo "$PEERS_CONF" > /etc/squid/peers.conf
service squid start
tail -f /dev/null