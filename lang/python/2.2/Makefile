# $OpenBSD: Makefile,v 1.8.2.1 2005/03/28 10:01:04 sturm Exp $

VERSION=	2.2
PATCHLEVEL=	.3
PKG_PATCHLEVEL=	p2

.if ${MACHINE_ARCH} == "alpha" || ${MACHINE_ARCH} == "amd64" || ${MACHINE_ARCH} == "sparc64"
PATCH_LIST=	patch-* sup64-*
.endif

.include <bsd.port.mk>

