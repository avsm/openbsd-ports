# $OpenBSD: Makefile,v 1.6 2011/09/24 19:09:43 kili Exp $

COMMENT=		certificates and Key Reader/Writer

DISTNAME=		certificate-0.7.0
REVISION =		2
CATEGORIES=		security

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# 3-clause BSD
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES=		lang/ghc

MODGHC_BUILD =          cabal hackage haddock register

RUN_DEPENDS =		devel/hs-base64-bytestring \
			devel/hs-mtl \
			hs-asn1-data->=0.4.6,<0.5.0:security/hs-asn1-data
BUILD_DEPENDS = 	${RUN_DEPENDS}

.include <bsd.port.mk>
