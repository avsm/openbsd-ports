# $OpenBSD: Makefile,v 1.6.2.1 2000/09/15 05:25:36 marc Exp $

DISTNAME=	wmx-6pre6
PKGNAME=        wmx-6pre6
CATEGORIES=	x11
NEED_VERSION=	1.302

MASTER_SITES=	http://www.all-day-breakfast.com/wmx/
HOMEPAGE=	http://www.all-day-breakfast.com/wmx/

MAINTAINER=	jakob@openbsd.org

PERMIT_PACKAGE_CDROM=	YES
PERMIT_PACKAGE_FTP=	YES
PERMIT_DISTFILES_CDROM=	YES
PERMIT_DISTFILES_FTP=	YES

CONFIGURE_STYLE=	gnu

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/wmx ${PREFIX}/bin
	@${INSTALL_DATA_DIR} ${PREFIX}/share/doc/wmx
	@${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/wmx

.include <bsd.port.mk>
