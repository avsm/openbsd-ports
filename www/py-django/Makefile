# $OpenBSD: Makefile,v 1.21 2011/09/16 12:00:08 espie Exp $

COMMENT =	high-level Python web framework

MODPY_EGG_VERSION =	1.3
LNAME =			django
DISTNAME =		Django-${MODPY_EGG_VERSION}
PKGNAME =		py-${LNAME}-${MODPY_EGG_VERSION}
CATEGORIES =		www
REVISION =		3

HOMEPAGE =	http://www.djangoproject.com/

MAINTAINER =	Ryan Boggs <rmboggs@gmail.com>

# BSD License
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

MASTER_SITES =	http://media.djangoproject.com/releases/${MODPY_EGG_VERSION}/

MODULES =	lang/python

SUBST_VARS +=	LNAME

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${LNAME}
	cd ${WRKSRC}/docs && pax -rw * ${PREFIX}/share/doc/${LNAME}

do-regress:
	cd ${WRKSRC} && env LC_CTYPE=en_US.UTF-8 PYTHONPATH=. \
		${MODPY_BIN} tests/runtests.py --settings=test_sqlite

.include <bsd.port.mk>
