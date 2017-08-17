#!/usr/bin/env bash

set -eo pipefail; [[ "$TRACE" ]] && set -x

main() {
	declare version="${1:-$GLIBC_VERSION}"

	: "${version:?}"

	{
		wget -qO- "http://ftp.gnu.org/gnu/glibc/glibc-$version.tar.gz" \
			| tar zxf -
		mkdir -p /glibc-build && cd /glibc-build
		"/glibc-$version/configure" \
			--prefix="/usr/glibc-compat" \
			--libdir="/usr/glibc-compat/lib" \
			--libexecdir="/usr/glibc-compat/lib" \
			--enable-multi-arch
		make && make install
		tar --hard-dereference -zcf "/glibc-bin-$version.tar.gz" "/usr/glibc-compat"
	} >&2

	[[ $STDOUT ]] && cat "/glibc-bin-$version.tar.gz"
}

main "$@"