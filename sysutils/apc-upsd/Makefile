# New ports collection makefile for:    apc-upsd
# Date created:         28 Dec 1999
# Whom:                 Kevin Lo <kevlo@openbsd.org>
#
# $OpenBSD: Makefile,v 1.7.2.1 2000/09/15 05:18:05 marc Exp $
#

DISTNAME=       apc-upsd
CATEGORIES=     sysutils
NEED_VERSION=	1.307
MASTER_SITES=   http://www.knienieder.com/software/

MAINTAINER=     kevlo@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=   .tgz

WRKDIST=         ${WRKDIR}/${DISTNAME}/src

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/apc-upsd
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/apc-upsd
	${INSTALL_PROGRAM} ${WRKSRC}/apc-upsd ${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/../doc/smart-protocol ${PREFIX}/share/doc/apc-upsd
	${INSTALL_DATA} ${WRKSRC}/apc-upsd.conf ${PREFIX}/lib/apc-upsd

.include <bsd.port.mk>
