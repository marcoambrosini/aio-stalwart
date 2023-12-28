# From https://github.com/stalwartlabs/mail-server/blob/main/Dockerfile
FROM stalwartlabs/mail-server:v0.5.0

COPY --chmod=775 start.sh /start.sh

# hadolint ignore=DL3008
 RUN set -ex; \
     \
     export DEBIAN_FRONTEND=noninteractive; \
     apt-get update; \
     apt-get install -y --no-install-recommends \
         vim \
     ; \
     rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3002
USER root
ENTRYPOINT [ "/start.sh" ]
