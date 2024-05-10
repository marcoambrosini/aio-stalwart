#!/bin/bash

CERT_DIR="/opt/aio-certs"
CERT_PRIV="$CERT_DIR/privkey.key"
CERT_PUP="$CERT_DIR/fullchain.crt"

mkdir -p $CERT_DIR
rm -f "$CERT_PRIV"
rm -f "$CERT_PUP"

AIO_PRIV="/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/mail.$NC_DOMAIN.key"
AIO_PUB="/caddy/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.$NC_DOMAIN/mail.$NC_DOMAIN.crt"

while ! [ -f "$CERT_PRIV" ]; do
    echo "Waiting for key to get created..."
    sleep 5
    [ -f "$AIO_PRIV" ] && cp "$AIO_PRIV" "$CERT_PRIV"
done

while ! [ -f $CERT_PUP ]; do
    echo "Waiting for cert to get created..."
    sleep 5
    [ -f "$AIO_PUB" ] && cp "$AIO_PUB" "$CERT_PUP"
done

echo "Stalwart container started"

# Run the normal entrypoint
/usr/local/bin/entrypoint.sh
