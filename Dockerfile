# SPDX-License-Identifier: MIT AND Apache-2.0
# Original: Copyright (c) 2020 Abdud Dayan Adeeb (MIT License)
# Modified by: Tenstorrent USA, Inc. (Apache 2.0 License)
# See NOTICE file for full copyright and license information

ARG UBUNTU_VERSION=22.04
FROM mirror.gcr.io/ubuntu:${UBUNTU_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apt -y update && apt -y install docker.io

ENTRYPOINT ["/entrypoint.sh"]
