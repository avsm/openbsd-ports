# $OpenBSD: Makefile,v 1.4 2010/11/22 08:36:53 espie Exp $

COMMENT=	.zip file importer for Plone

VERSION=	0.9
DISTNAME=	MassLoader-${VERSION}
PKGNAME=	plone-${DISTNAME:L}
REVISION=	1
CATEGORIES=	www
HOMEPAGE=	http://plone.org/products/massloader

# GPL v2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}/releases/${VERSION}/
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

RUN_DEPENDS=	www/zope-logger

WRKDIST=	${WRKDIR}/MassLoader-0.9b

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}/MassLoader
	cd ${WRKDIST}; tar cf - . | tar xf - \
		-C ${MODZOPE_PRODUCTSDIR}/MassLoader

.include <bsd.port.mk>
