#!/usr/bin/env bash

source set-glibc-version.sh

docker build -t mbe1224/glibc-builder:$GLIBC_VERSION .
