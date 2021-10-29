FROM python:3.10.0-alpine3.14

LABEL name="docker-watcher3" \
      maintainer="Jee jee@eer.fr" \
      description="Watcher is an automated movie NZB & Torrent searcher and snatcher." \
      url="https://github.com/barbequesauce/watcher3" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-watcher3" \
      org.opencontainers.image.source="https://github.com/jee-r/docker-watcher3" 
      
COPY rootfs /

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
      git \
      tzdata && \
    mkdir -p /app && \
		chmod -R 777 /app

WORKDIR /config

EXPOSE 9090

HEALTHCHECK --interval=5m --timeout=3s --start-period=90s \
  CMD /usr/local/bin/healthcheck.sh 9090

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
