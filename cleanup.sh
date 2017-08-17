#!/usr/bin/env bash

docker stop glibc-builder
docker rm glibc-builder
docker rmi mbe1224/glibc-builder:2.25