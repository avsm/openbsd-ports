# $OpenBSD: Makefile,v 1.6 2010/11/11 12:35:19 sthen Exp $

COMMENT=	methods to apply to Zope objects for XML/XSLT processing

VERSION=	1.0.0
DISTNAME=	zopexmlmethods-${VERSION:S/./-/g}
PKGNAME=	zope-xmlmethods-${VERSION}
REVISION=	1
CATEGORIES=	www
HOMEPAGE=	http://zopexmlmethods.sourceforge.net/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=zopexmlmethods/}
EXTRACT_SUFX=	.zip

MODULES=	www/zope

WRKDIST=	${WRKDIR}/ZopeXMLMethods

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - ZopeXMLMethods | tar xf - \
		-C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
