# $OpenBSD: Makefile,v 1.25 2010/10/24 20:58:59 ajacoutot Exp $

COMMENT=	set the root window to the moon in its current phase
DISTNAME=	xphoon
PKGNAME=	xphoon-91.9.18
CATEGORIES=	astro x11

HOMEPAGE=	http://xphoon.sourceforge.net/
MASTER_SITES=	${MASTER_SITE_R5CONTRIB}
EXTRACT_SUFX=	.tar.Z

# BSD like
PERMIT_PACKAGE_CDROM=   Cannot sell
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Cannot sell
PERMIT_DISTFILES_FTP=   Yes

REVISION =	4
WANTLIB=	X11 Xau Xdmcp Xext c m

CONFIGURE_STYLE= imake

USE_GROFF =	Yes
NO_REGRESS=	Yes

.include <bsd.port.mk>
