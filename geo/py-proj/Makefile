# $OpenBSD: Makefile,v 1.9 2011/09/16 09:48:11 espie Exp $

COMMENT =		Pyrex generated python interface to PROJ.4 library

MODPY_EGG_VERSION =	1.8.9
DISTNAME =		pyproj-${MODPY_EGG_VERSION}
PKGNAME =		${DISTNAME:S/py/py-/}
REVISION =		1

CATEGORIES =		geo

HOMEPAGE =		http://code.google.com/p/pyproj/

MAINTAINER =		Benoit Lecocq <benoit@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB += proj

MASTER_SITES =		http://pyproj.googlecode.com/files/

MODULES =		lang/python

BUILD_DEPENDS +=	${RUN_DEPENDS}
LIB_DEPENDS +=		devel/proj
RUN_DEPENDS +=		math/py-numpy

do-regress: fake
	cd ${WRKSRC}/test && ${MAKE_ENV} \
		PYTHONPATH=${WRKINST}${MODPY_SITEPKG} ${MODPY_BIN} ./test.py
	cd ${WRKSRC}/test && ${MAKE_ENV} \
		PYTHONPATH=${WRKINST}${MODPY_SITEPKG} ${MODPY_BIN} ./test2.py

.include <bsd.port.mk>
