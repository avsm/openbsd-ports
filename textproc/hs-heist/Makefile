# $OpenBSD: Makefile,v 1.10 2011/09/24 19:08:10 kili Exp $

COMMENT =		xhtml templating system

DISTNAME =		heist-0.5.3
CATEGORIES =		textproc

MAINTAINER =		Jim Razmus II <jim@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS +=		devel/hs-MonadCatchIO-transformers \
			devel/hs-blaze-builder \
			devel/hs-directory-tree \
			devel/hs-mtl \
			devel/hs-text \
			devel/hs-transformers \
			textproc/hs-attoparsec \
			textproc/hs-attoparsec-text \
			textproc/hs-xmlhtml
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
