# $OpenBSD: Makefile,v 1.15 2011/09/16 12:00:08 espie Exp $

COMMENT =		HTML form validation, generation, and conversion

MODPY_EGG_VERSION =	1.2.2
DISTNAME =		FormEncode-${MODPY_EGG_VERSION}
PKGNAME =		py-formencode-${MODPY_EGG_VERSION}
REVISION =		2

CATEGORIES =		www

HOMEPAGE =		http://www.formencode.org/

MAINTAINER =		Martynas Venckus <martynas@openbsd.org>

# PSF
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =		${MASTER_SITE_PYPI:=F/FormEncode/}

MODULES =		devel/gettext \
			lang/python

REGRESS_DEPENDS =	databases/py-sqlobject \
			devel/py-nose

MODPY_SETUPTOOLS =	Yes

post-install:
	rm -f ${WRKSRC}/docs/test_docs.py{.orig,c}
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-formencode
	cd ${WRKSRC}/docs && pax -rw * ${PREFIX}/share/doc/py-formencode/
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/py-formencode
	cd ${WRKSRC}/examples && pax -rw * \
	    ${PREFIX}/share/examples/py-formencode/

do-regress:
	cd ${WRKSRC} && ${LOCALBASE}/bin/nosetests tests

.include <bsd.port.mk>
