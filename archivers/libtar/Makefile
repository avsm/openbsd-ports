# $OpenBSD: Makefile,v 1.6 2010/10/18 16:47:00 espie Exp $

COMMENT=	C library for manipulating tar files

DISTNAME=	libtar-1.2.11

SHARED_LIBS=	tar	0.0	# .1.2

CATEGORIES=	archivers devel

HOMEPAGE=	http://www.feep.net/libtar/

# BSD-like
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

REVISION =	0
WANTLIB=	c z

MASTER_SITES=	http://distfiles.nl/ \
		ftp://ftp.feep.net/pub/software/libtar/

USE_LIBTOOL=	Yes
NO_REGRESS=	Yes
USE_GROFF =	Yes

CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
