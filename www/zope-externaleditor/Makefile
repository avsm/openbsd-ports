# $OpenBSD: Makefile,v 1.7 2010/11/11 12:35:19 sthen Exp $

COMMENT=	Zope product to use an external editor to edit Zope objects

VERSION=	0.9.3
DISTNAME=	ExternalEditor-${VERSION}-src
PKGNAME=	zope-externaleditor-${VERSION}
REVISION=	1
CATEGORIES=	www

HOMEPAGE=	http://plope.com/software/ExternalEditor/

# ZPL 
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	 cd ${WRKDIR}; \
		tar cf - ExternalEditor | tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
