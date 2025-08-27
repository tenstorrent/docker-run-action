ARG UBUNTU_VERSION=22.04
FROM mirror.gcr.io/ubuntu:${UBUNTU_VERSION}

RUN apk add bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
