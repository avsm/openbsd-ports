# $OpenBSD: Makefile,v 1.6 2011/10/21 16:23:45 espie Exp $

COMMENT =	web error handling and exception catching

MODPY_EGG_VERSION = 0.10.1
DISTNAME =	WebError-${MODPY_EGG_VERSION}
PKGNAME =	py-${DISTNAME:L}
REVISION =	2

CATEGORIES =	www devel

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_PYPI:=W/WebError/}

MODULES =	lang/python

RUN_DEPENDS =	devel/py-simplejson \
		textproc/py-pygments \
		www/py-paste \
		www/py-tempita \
		www/py-webob
REGRESS_DEPENDS = ${RUN_DEPENDS} \
		  devel/py-nose \
		  www/py-webtest

MODPY_SETUPTOOLS =	Yes

pre-build:
	chmod 644 ${WRKSRC}/WebError.egg-info/*

do-regress:
	cd ${WRKSRC} && ${LOCALBASE}/bin/nosetests lib tests

.include <bsd.port.mk>
