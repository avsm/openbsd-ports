# $OpenBSD: Makefile,v 1.11 2011/09/16 08:48:04 espie Exp $

COMMENT =		Python interface to Redis

MODPY_EGG_VERSION =	2.4.9
DISTNAME =		redis-${MODPY_EGG_VERSION}
PKGNAME =		py-redis-${MODPY_EGG_VERSION}
CATEGORIES =		databases
REVISION =		0

HOMEPAGE =		http://github.com/andymccurdy/redis-py/
MASTER_SITES =		http://github.com/downloads/andymccurdy/redis-py/

MAINTAINER = 		Remi Pointel <rpointel@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/python

MODPY_SETUPTOOLS =	Yes

# avoid possible conflict with the databases/redis distfile
DIST_SUBDIR =           py-redis
WRKDIST =		${WRKDIR}/redis-${MODPY_EGG_VERSION}

NO_REGRESS =		Yes

.include <bsd.port.mk>
