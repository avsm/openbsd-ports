# $OpenBSD: Makefile,v 1.11 2011/09/16 12:00:08 espie Exp $

COMMENT =		tools for using web server gateway interface stack

MODPY_EGG_VERSION =	1.7.2
DISTNAME =		Paste-${MODPY_EGG_VERSION}
PKGNAME =		py-paste-${MODPY_EGG_VERSION}
REVISION =		2

CATEGORIES =		www

HOMEPAGE =		http://pythonpaste.org/

MAINTAINER =		Martynas Venckus <martynas@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =		${MASTER_SITE_PYPI:=P/Paste/}

MODULES =		lang/python
RUN_DEPENDS =		www/py-flup
REGRESS_DEPENDS =	${RUN_DEPENDS} \
			devel/py-py

MODPY_SETUPTOOLS =	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-paste
	cd ${WRKSRC}/docs && pax -rw * ${PREFIX}/share/doc/py-paste/

pre-regress:
	perl -pi -e 's,/usr/bin/env python,${MODPY_BIN},g' \
		${WRKSRC}/tests/cgiapp_data/*.cgi

do-regress:
	cd ${WRKSRC} && ${LOCALBASE}/bin/py.test .

.include <bsd.port.mk>
