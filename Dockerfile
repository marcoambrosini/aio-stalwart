# From https://github.com/stalwartlabs/mail-server/blob/main/Dockerfile
FROM stalwartlabs/mail-server:v0.7.3

COPY config.toml /opt/stalwart-mail/etc/config.toml
