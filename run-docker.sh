#!/usr/bin/env bash

docker stop glibc-builder
docker rm glibc-builder

docker run --name glibc-builder mbe1224/glibc-builder:2.26 2.26