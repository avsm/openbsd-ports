# $OpenBSD: Makefile,v 1.7 2010/11/11 12:35:19 sthen Exp $

COMMENT=	framework that eases creation and validation of web forms

DISTNAME=	Formulator-1.6.2
PKGNAME=	zope-${DISTNAME:L}
REVISION=	1
CATEGORIES=	www

HOMEPAGE=	http://zope.org/Members/infrae/Formulator/

# BSD 
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}${DISTNAME}/
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

WRKDIST=	${WRKDIR}/Formulator

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - Formulator | tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
