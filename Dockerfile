ARG UBUNTU_VERSION=22.04
FROM mirror.gcr.io/ubuntu:${UBUNTU_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apt install docker.io

ENTRYPOINT ["/entrypoint.sh"]
