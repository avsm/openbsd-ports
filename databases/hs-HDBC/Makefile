# $OpenBSD: Makefile,v 1.16 2011/09/16 08:48:02 espie Exp $

COMMENT =		abstraction layer for SQL relational databases

DISTNAME =		HDBC-2.2.7.0
CATEGORIES =		databases
HOMEPAGE =		http://software.complete.org/hdbc
REVISION =		0

MAINTAINER =		David Coppa <dcoppa@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS +=		devel/hs-convertible>=1.0.10.0 \
			devel/hs-mtl
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
