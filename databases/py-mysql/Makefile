# $OpenBSD: Makefile,v 1.40 2011/09/16 08:48:04 espie Exp $

SHARED_ONLY =	Yes

COMMENT =	Python interface to MySQL

MODPY_EGG_VERSION =	1.2.3
DISTNAME =	MySQL-python-${MODPY_EGG_VERSION}
PKGNAME =	py-mysql-${MODPY_EGG_VERSION}
REVISION =		1

CATEGORIES =	databases

HOMEPAGE =	http://mysql-python.sourceforge.net/

MAINTAINER =	Benoit Lecocq <benoit@openbsd.org>

# GPL
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

WANTLIB =	crypto m pthread ssl z
WANTLIB +=	lib/mysql/mysqlclient_r>=14

MASTER_SITES =  ${MASTER_SITE_SOURCEFORGE:=mysql-python/}

MODULES =	lang/python
LIB_DEPENDS =	databases/mysql

NO_REGRESS =	Yes

MODPY_SETUPTOOLS = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-mysql
	${INSTALL_DATA} ${WRKBUILD}/doc/*.txt ${PREFIX}/share/doc/py-mysql/

.include <bsd.port.mk>
