# $OpenBSD: Makefile,v 1.12 2011/09/16 09:24:50 espie Exp $

COMMENT =		functional graph library

DISTNAME =		fgl-5.4.2.3
REVISION =		4
CATEGORIES =		devel
HOMEPAGE =		http://web.engr.oregonstate.edu/~erwig/fgl/haskell/

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS +=		devel/hs-mtl
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
