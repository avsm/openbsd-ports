# $OpenBSD: Makefile,v 1.5 2011/09/24 19:09:59 kili Exp $

COMMENT=		convert an Attoparsec parser into an iteratee

DISTNAME=		attoparsec-enumerator-0.2.0.3
REVISION=		3
CATEGORIES=		textproc

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES=		lang/ghc

MODGHC_BUILD =          cabal hackage haddock register

RUN_DEPENDS =		devel/hs-enumerator \
			textproc/hs-attoparsec
BUILD_DEPENDS = 	${RUN_DEPENDS}

.include <bsd.port.mk>
