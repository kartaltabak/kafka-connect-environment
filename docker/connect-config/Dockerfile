FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
      curl

COPY source.json /source.json

COPY --chmod=755 init.sh /init.sh

ENTRYPOINT ["/init.sh"]