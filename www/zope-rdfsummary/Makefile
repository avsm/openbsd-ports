# $OpenBSD: Makefile,v 1.7 2010/11/11 12:35:19 sthen Exp $

COMMENT=	Zope product to display RSS files

V=		2-4
DISTNAME=	RDFSummary-${V}
PKGNAME=	zope-rdfsummary-${V:S/-/./}
REVISION=	0
CATEGORIES=	www

HOMEPAGE=	http://www.zope.org/Members/EIONET/RDFSummary/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}${V:S/-/./}/
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

WRKDIST=	${WRKDIR}/RDFSummary

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - RDFSummary | tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
