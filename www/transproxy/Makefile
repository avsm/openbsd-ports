# $OpenBSD: Makefile,v 1.6.2.1 2000/09/15 05:22:24 marc Exp $

DISTNAME=	transproxy-0.4
CATEGORIES=	www net
MASTER_SITES=	ftp://ftp.nlc.net.au/pub/linux/www/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@openbsd.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

ALL_TARGET=	tproxy

do-install:
	cd ${WRKSRC}; ${INSTALL_PROGRAM} ${WRKSRC}/tproxy ${PREFIX}/sbin

.include <bsd.port.mk>
