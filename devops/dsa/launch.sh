#!/usr/bin/env bash

build="${1:---build}"

set -xe
DSA_MONGODB_PORT=6061 DSA_PORT=6060 DSA_USER=$UID:$(id -g) docker compose -f docker-compose.yml -f docker-compose-override.yaml -p $USER up $build
