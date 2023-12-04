#!/bin/bash

while ! [ -d "/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/" ]; do
    echo "Waiting for cert directory to get created..."
    sleep 5
done

while ! [ -f "/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/mail.$NC_DOMAIN.crt" ]; do
    echo "Waiting for cert to get created..."
    sleep 5
done

mkdir -p /opt/stalwart-mail/etc/certs
rm -f "/opt/stalwart-mail/etc/certs/mail.$NC_DOMAIN/fullchain.pem"
rm -f "/opt/stalwart-mail/etc/certs/mail.$NC_DOMAIN/privkey.pem"
cp "/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/mail.$NC_DOMAIN.crt" "/opt/stalwart-mail/etc/certs/mail.$NC_DOMAIN/fullchain.pem"
cp "/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/mail.$NC_DOMAIN.key" "/opt/stalwart-mail/etc/certs/mail.$NC_DOMAIN/privkey.pem"

# Run the normal entrypoint
/usr/local/bin/entrypoint.sh
