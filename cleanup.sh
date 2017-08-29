#!/usr/bin/env bash

source set-glibc-version.sh

docker stop glibc-builder
docker rm glibc-builder
docker rmi mbe1224/glibc-builder:$GLIBC_VERSION
docker rmi mbe1224/glibc-builder
