#!/bin/sh
echo "$PEERS_CONF" >/etc/squid/peers.conf
if [ "$PROXY_AUTH" = true ]; then
  htpasswd -cb /etc/squid/passwd "${PROXY_USERNAME}" "${PROXY_PASSWORD}"
  mv /etc/squid/auth.conf /etc/squid/squid.conf
fi
service squid start
tail -f /dev/null
