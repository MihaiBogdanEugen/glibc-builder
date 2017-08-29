#!/usr/bin/env bash

set -eo pipefail; [[ "$TRACE" ]] && set -x

source set-glibc-version.sh

main() 
{
	{
		wget -qO- "http://ftp.gnu.org/gnu/glibc/glibc-$GLIBC_VERSION.tar.gz" \
			| tar zxf -
		mkdir -p /glibc-build && cd /glibc-build
		"/glibc-$GLIBC_VERSION/configure" \
			--prefix="/usr/glibc-compat" \
			--libdir="/usr/glibc-compat/lib" \
			--libexecdir="/usr/glibc-compat/lib" \
			--enable-multi-arch
		make && make install
		tar --hard-dereference -zcf "/glibc-bin-$GLIBC_VERSION.tar.gz" "/usr/glibc-compat"
	} >&2

	[[ $STDOUT ]] && cat "/glibc-bin-$GLIBC_VERSION.tar.gz"
}

main "$@"
