# $OpenBSD: Makefile,v 1.6 2011/09/16 12:00:08 espie Exp $

COMMENT =	http proxying tools for wsgi apps

MODPY_EGG_VERSION = 0.2
DISTNAME =	WSGIProxy-${MODPY_EGG_VERSION}
PKGNAME =	py-${DISTNAME:L}
REVISION =	2

CATEGORIES =	www devel

HOMEPAGE =	http://pythonpaste.org/wsgiproxy/

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_PYPI:=W/WSGIProxy/}

MODULES =	lang/python

MODPY_SETUPTOOLS =	Yes

RUN_DEPENDS =	devel/py-simplejson \
		www/py-paste

NO_REGRESS =	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-wsgiproxy
	${INSTALL_DATA} ${WRKSRC}/docs/index.txt \
	    ${PREFIX}/share/doc/py-wsgiproxy

.include <bsd.port.mk>
