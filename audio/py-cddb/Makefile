# $OpenBSD: Makefile,v 1.15 2011/10/12 12:54:30 jasper Exp $

SHARED_ONLY=	Yes

COMMENT=	CDDB audio CD track info access in Python

DISTNAME=	CDDB-1.4
PKGNAME=	py-${DISTNAME:L}
REVISION =	6
CATEGORIES=	audio

HOMEPAGE=	http://cddb-py.sourceforge.net/

MAINTAINER=	Xavier Santolaria <xsa@openbsd.org>

# GPL 
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB = ${MODPY_WANTLIB}

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=cddb-py/}
# avoid possible conflict with the audio/p5-cddb distfile
DIST_SUBDIR=	py-cddb

MODULES=	lang/python

NO_REGRESS=	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-cddb
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/py-cddb

.include <bsd.port.mk>
