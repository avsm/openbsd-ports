# $OpenBSD: Makefile,v 1.4 2010/11/11 12:35:19 sthen Exp $

COMMENT=	framework for expressing the configured state of a Zope Site

DISTNAME=	GenericSetup-1.2
PKGNAME=	zope-${DISTNAME:L}
REVISION=	1
CATEGORIES=	www

HOMEPAGE=	http://www.zope.org/Products/GenericSetup/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://www.zope.org/Products/GenericSetup/${DISTNAME}/ 

MODULES=	www/zope

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; \
	    tar -cs /${DISTNAME}/${DISTNAME:C/-.*//g}/ -f - ${DISTNAME} | \
	    tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
