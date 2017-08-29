#!/usr/bin/env bash

source set-glibc-version.sh

docker stop glibc-builder
docker rm glibc-builder

docker run --name glibc-builder mbe1224/glibc-builder:$GLIBC_VERSION $GLIBC_VERSION
