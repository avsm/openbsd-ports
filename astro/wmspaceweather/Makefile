# $OpenBSD: Makefile,v 1.28 2010/11/15 00:22:46 espie Exp $

COMMENT=		wm-dockapp; space weather monitor

DISTNAME=		wmSpaceWeather-1.04
PKGNAME=		${DISTNAME:L}
CATEGORIES=		astro x11 x11/windowmaker

MAINTAINER=		Peter Stromberg <wilfried@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

REVISION =	4
WANTLIB=		X11 Xext Xpm c

MASTER_SITES=		http://distfiles.nl/

MAKE_ENV=		CC="${CC}"
USE_GROFF =		Yes
NO_REGRESS=		Yes

WRKSRC=			${WRKDIST}/wmSpaceWeather

post-extract:
	@cd ${WRKSRC} && make clean

.include <bsd.port.mk>
