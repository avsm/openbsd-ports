# $OpenBSD: Makefile,v 1.42.4.2 2004/07/10 23:41:49 brad Exp $

COMMENT=	"library for manipulating PNG images"

DISTNAME=	libpng-1.2.5
PKGNAME=	${DISTNAME:S/lib//}p3
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libpng/}

HOMEPAGE=	http://www.libpng.org/pub/png/libpng.html

MAINTAINER=	Brad Smith <brad@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

FAKE_FLAGS=	DESTDIR="${WRKINST}" PREFIX="${PREFIX}"

MAKE_ENV=	CC="${CC}"
MAKE_FILE=	scripts/makefile.openbsd

REGRESS_TARGET=	test

.include <bsd.port.mk>
