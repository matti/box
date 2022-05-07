FROM --platform=amd64 ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl ca-certificates cmatrix nano htop \
  && apt-get clean

RUN mkdir /ghjk && cd /ghjk \
  && curl -Lsf -O https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 \
  && chmod +x ttyd.x86_64 \
  && mv ttyd.x86_64 /usr/local/bin/ttyd \
  && rm -rf /ghjk

LABEL org.opencontainers.image.source = "https://github.com/matti/box"
COPY entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]