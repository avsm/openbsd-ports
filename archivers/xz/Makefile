# $OpenBSD: Makefile,v 1.10 2011/07/27 19:06:45 naddy Exp $

COMMENT=	LZMA compression and decompression tools

DISTNAME=	xz-5.0.3
REVISION=	1
SHARED_LIBS=	lzma                 1.0      # .5.3
CATEGORIES=	archivers

HOMEPAGE=	http://tukaani.org/xz/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}

MODULES=	devel/gettext

WANTLIB=	c

USE_LIBTOOL=	Yes
USE_GROFF=	Yes
SEPARATE_BUILD=	simple
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--disable-threads
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build-aux

.include <bsd.port.mk>
