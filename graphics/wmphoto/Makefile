# $OpenBSD: Makefile,v 1.16 2010/11/17 08:05:16 espie Exp $

COMMENT=		wm-dockapp; shows photos and execute commands on that photo

DISTNAME=		wmphoto-0.3a
REVISION =		1
CATEGORIES=		graphics x11 x11/windowmaker

HOMEPAGE=		http://www.dcc.uchile.cl/~amartoq/wmphoto/

MAINTAINER=		Peter Stromberg <wilfried@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${HOMEPAGE}

RUN_DEPENDS=		graphics/ImageMagick
WANTLIB=		X11 Xext Xpm c pthread-stubs xcb

USE_GROFF =		Yes
NO_REGRESS=		Yes

WRKSRC=			${WRKDIST}/wmphoto

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/wmphoto ${PREFIX}/bin
	${INSTALL_MAN} files/wmphoto.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
