# $OpenBSD: Makefile,v 1.20.2.1 2000/09/15 05:24:44 marc Exp $

DISTNAME=	blackbox-0.60.3
CATEGORIES=	x11
NEED_VERSION=	1.310
MASTER_SITES=	ftp://portal.alug.org/pub/blackbox/0.6x.x/ \
		ftp://ftp.dti.ad.jp/pub/X/blackbox/0.6x.x/

HOMEPAGE=	http://blackbox.alug.org/

MAINTAINER=	rohee@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--disable-styled-frames

DOCS=	AUTHORS ChangeLog ChangeLog-0.40.x ChangeLog-0.50.x \
	ChangeLog-0.51.x README

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/blackbox
	cd ${WRKSRC}; ${INSTALL_DATA} ${DOCS} ${PREFIX}/share/doc/blackbox

.include <bsd.port.mk>
