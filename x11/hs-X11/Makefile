# $OpenBSD: Makefile,v 1.11 2011/09/16 12:29:15 espie Exp $

COMMENT =		bindings to the X11 graphics library for GHC

DISTNAME =		X11-1.5.0.0
REVISION =		7

CATEGORIES =		x11 devel

HOMEPAGE =		http://code.haskell.org/X11/

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

MODULES =		lang/ghc
MODGHC_BUILD =		cabal hackage haddock register

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		devel/hs-syb


.include <bsd.port.mk>
