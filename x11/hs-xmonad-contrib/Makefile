# $OpenBSD: Makefile,v 1.16 2011/09/16 12:29:15 espie Exp $

COMMENT =		third party xmonad extensions

DISTNAME =		xmonad-contrib-0.9.2
REVISION =		3
CATEGORIES =		x11
HOMEPAGE =		http://www.xmonad.org/

MAINTAINER =		Jona Joachim <jaj@hcl-club.lu>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc
MODGHC_BUILD =		cabal hackage register haddock

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		devel/hs-mtl \
			shells/bash \
			x11/hs-X11-xft \
			x11/xmonad,-lib

NO_REGRESS =		Yes

VMEM_WARNING =		Yes

.include <bsd.port.mk>
