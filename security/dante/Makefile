# $OpenBSD: Makefile,v 1.6.2.1 2000/09/15 05:15:09 marc Exp $

DISTNAME=	dante-1.1.2
CATEGORIES=	security
NEED_VERSION=	1.310

MASTER_SITES=	ftp://ftp.inet.no/pub/socks/

MAINTAINER=     jakob@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

CONFIGURE_STYLE=	gnu

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/socks
	${INSTALL_DATA} ${WRKSRC}/example/*.conf ${PREFIX}/share/examples/socks

.include <bsd.port.mk>
