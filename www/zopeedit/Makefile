# $OpenBSD: Makefile,v 1.5 2010/11/11 12:35:19 sthen Exp $

COMMENT=	client application for zope-externaleditor

VERSION=	0.9.3
DISTNAME=	zopeedit-${VERSION}-src
PKGNAME=	zopeedit-${VERSION}
REVISION=	0
CATEGORIES=	www

HOMEPAGE=	http://plope.com/software/ExternalEditor

# Zope Public License
PERMIT_PACKAGE_FTP= 	Yes
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_DISTFILES_FTP=   Yes
PERMIT_DISTFILES_CDROM= Yes

MASTER_SITES=	${HOMEPAGE}/
EXTRACT_SUFX=	.tgz

PYTHON_VER=	2.4

WRKDIST=	${WRKDIR}/zopeedit-${VERSION}

NO_BUILD=      yes
USE_GROFF =	Yes
 
do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zopeedit.py ${PREFIX}/bin/zopeedit
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/zopeedit
	${INSTALL_DATA} ${WRKSRC}/README.txt ${PREFIX}/share/doc/zopeedit
	${INSTALL_DATA} ${WRKSRC}/man/zopeedit.1 ${PREFIX}/man/man1/zopeedit.1

.include <bsd.port.mk>
