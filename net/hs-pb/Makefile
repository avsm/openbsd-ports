# $OpenBSD: Makefile,v 1.5 2011/06/30 21:36:37 kili Exp $

COMMENT=	pastebin command line application

DISTNAME=	pb-0.1.0
REVISION=	2
CATEGORIES=	net sysutils

MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>

# 3-clause BSD
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB=		c gmp m pthread util

MODULES=		converters/libiconv \
			lang/ghc

MODGHC_BUILD =          cabal hackage nort

BUILD_DEPENDS +=        devel/hs-network \
			net/hs-HTTP

LIB_DEPENDS=		devel/gmp

.include <bsd.port.mk>
