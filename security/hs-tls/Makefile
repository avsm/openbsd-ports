# $OpenBSD: Makefile,v 1.7 2011/09/16 11:41:38 espie Exp $

COMMENT=		TLS/SSL protocol native implementation

DISTNAME=		tls-0.6.1
REVISION =		0
CATEGORIES=		security net

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES=		lang/ghc

MODGHC_BUILD =          cabal hackage haddock register

RUN_DEPENDS =		devel/hs-cereal>=0.3 \
			devel/hs-mtl \
			devel/hs-vector \
			security/hs-crypto-api>=0.5 \
			security/hs-certificate>=0.7.0 \
			security/hs-cryptocipher>=0.2.5 \
			security/hs-cryptohash>=0.6
BUILD_DEPENDS = 	${RUN_DEPENDS}

.include <bsd.port.mk>
