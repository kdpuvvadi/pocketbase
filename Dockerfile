FROM ghcr.io/kdpuvvadi/alpine:latest
LABEL org.opencontainers.image.source = "https://github.com/kdpuvvadi/pocketbase"
LABEL org.opencontainers.image.description="pocketbase"
LABEL org.opencontainers.image.licenses=MIT

ENV ARCH $ARCH
WORKDIR /usr/src/app

RUN apk --no-cache upgrade --purge
RUN apk --no-cache add zip ca-certificates

ARG VERSION=0.19.4
ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCH=amd64; \
  elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then ARCH=armv7; \
  elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCH=arm64; \
  else ARCH=amd64; fi \
  && cd /usr/src/app \
  && curl -L -O "https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/pocketbase_${VERSION}_linux_${ARCH}.zip" \
  && unzip "pocketbase_${VERSION}_linux_${ARCH}.zip" \
  && rm "pocketbase_${VERSION}_linux_${ARCH}.zip"

EXPOSE 8090

CMD ["/usr/src/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
