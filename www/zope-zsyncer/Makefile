# $OpenBSD: Makefile,v 1.5 2010/11/11 12:35:19 sthen Exp $

COMMENT=	synchronize and compare Zope objects

DISTNAME=	ZSyncer-0.7.1
PKGNAME=	zope-${DISTNAME:L}
REVISION=	0
CATEGORIES=	www
HOMEPAGE=	http://zsyncer.sourceforge.net

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=zsyncer/}
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

WRKDIST=	${WRKDIR}/ZSyncer

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - ZSyncer | tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
