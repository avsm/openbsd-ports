# $OpenBSD: Makefile,v 1.17 2011/09/20 21:49:34 ajacoutot Exp $

COMMENT =	encrypted backup using rsync algorithm

MODPY_EGG_VERSION = 0.6.15
DISTNAME =	duplicity-${MODPY_EGG_VERSION}

CATEGORIES =	sysutils

HOMEPAGE =	http://www.nongnu.org/duplicity/
MASTER_SITES =	${MASTER_SITE_SAVANNAH:=duplicity/}

MAINTAINER =	Jim Razmus II <jim@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =	lang/python

WANTLIB +=	rsync ${MODPY_WANTLIB}
LIB_DEPENDS +=	net/librsync \
		${MODPY_LIB_DEPENDS}
RUN_DEPENDS +=	net/py-boto \
		net/ncftp \
		security/py-gnupg

MAKE_ENV +=	LIBRSYNC_DIR=${LOCALBASE}

USE_GROFF =	Yes
NO_REGRESS =	Yes

.include <bsd.port.mk>
