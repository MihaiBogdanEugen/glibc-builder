FROM ubuntu:latest
RUN apt-get -q update && apt-get -qy install build-essential wget openssl gawk
COPY configparams /glibc-build/configparams
COPY build-glibc.sh /build-glibc.sh
COPY set-glibc-version.sh /set-glibc-version.sh
ENTRYPOINT ["/build-glibc.sh"]
