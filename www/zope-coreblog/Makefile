# $OpenBSD: Makefile,v 1.7 2010/11/11 12:35:19 sthen Exp $

COMMENT=	weblog system for Zope

V=		1.2
DISTNAME=	COREBlog${V:S/.//}
PKGNAME=	zope-coreblog-${V}
REVISION=	0
CATEGORIES=	www

HOMEPAGE=	http://www.coreblog.org/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}junk/
EXTRACT_SUFX=	.tgz

MODULES=	www/zope

WRKDIST=	${WRKDIR}/COREBlog

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - COREBlog | tar xf - -C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
