# $OpenBSD: Makefile,v 1.10.2.1 2000/09/15 05:18:22 marc Exp $
# Original from: Ejovi Nuwere <ejovi@ejovi.net>

DISTNAME=	tcplist-2.2
CATEGORIES=	sysutils net
NEED_VERSION=	 1.230
MASTER_SITES=	ftp://ftp.cdf.toronto.edu/pub/jdd/tcplist/
EXTRACT_SUFX=	.shar

MAINTAINER=     ports@OpenBSD.ORG

LICENSE_TYPE=		BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	lsof::sysutils/lsof

WRKDIST=	${WRKDIR}
EXTRACT_CMD=	cat
EXTRACT_BEFORE_ARGS=	# empty
EXTRACT_AFTER_ARGS= | ${SH}

INSTALL_TARGET=	install install.man

.include <bsd.port.mk>
