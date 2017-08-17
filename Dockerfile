FROM debian:stable-slim
ENV GLIBC_VERSION 2.25
RUN apt-get -q update && apt-get -qy install build-essential wget openssl gawk
COPY configparams /glibc-build/configparams
COPY build-glibc.sh /build-glibc.sh
ENTRYPOINT ["/build-glibc.sh"]