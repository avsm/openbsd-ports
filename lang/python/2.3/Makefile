# $OpenBSD: Makefile,v 1.3.2.1 2005/03/29 20:27:32 sturm Exp $

VERSION=		2.3
PATCHLEVEL=		.5
PKG_PATCHLEVEL=

COMMENT-bsddb=		"Berkeley db module for Python"

FULLPKGNAME-bsddb=	python-bsddb-${VERSION}${PATCHLEVEL}${PKG_PATCHLEVEL}

CONFIGURE_STYLE=	autoconf
CONFIGURE_ARGS=		--enable-ipv6

AUTOCONF_VERSION=	2.57

LIB_DEPENDS=		bz2::archivers/bzip2

FLAVORS=		no_bsddb

.if (${MACHINE_ARCH} == "alpha") || (${MACHINE_ARCH} == "sparc64")
PATCH_LIST=		patch-* sup64-*
.endif

.include <bsd.port.mk>
