FROM ghcr.io/kdpuvvadi/alpine:latest
LABEL org.opencontainers.image.title="pocketbase"
LABEL org.opencontainers.image.authors="KD Puvvadi <kd@puvvadi.me>"
LABEL org.opencontainers.image.vendor="KD Puvvadi"
LABEL org.opencontainers.image.url="https://github.com/kdpuvvadi/pocketbase"
LABEL org.opencontainers.image.source="https://github.com/kdpuvvadi/pocketbase"
LABEL org.opencontainers.image.documentation="https://puvvadi.net/posts/deploy-pocketbase-with-docker-behind-traefik/"
LABEL org.opencontainers.image.description="Docker image for deploying pocketbase Service"
LABEL org.opencontainers.image.licenses="MIT"

ENV ARCH=$(ARCH)
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG VERSION=0.41.1
LABEL org.opencontainers.image.version=${VERSION}
ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCH=amd64; \
  elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCH=arm64; \
  else ARCH=amd64; fi \
  && cd /usr/src/app \
  && curl -fsSL -O "https://ganigeorgiev.com/meta/pocketbase/pocketbase/download/v${VERSION}/pocketbase_${VERSION}_linux_${ARCH}.zip" \
  && unzip "pocketbase_${VERSION}_linux_${ARCH}.zip" \
  && rm "pocketbase_${VERSION}_linux_${ARCH}.zip"

EXPOSE 8090

ENTRYPOINT ["/usr/src/app/pocketbase", "serve", "--http", "0.0.0.0:8090", "--dir", "/usr/src/app/pb_data", "--publicDir", "/usr/src/app/pb_public", "--hooksDir", "/usr/src/app/pb_hooks" ]

