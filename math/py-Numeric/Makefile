# $OpenBSD: Makefile,v 1.24 2011/09/16 10:31:22 espie Exp $

SHARED_ONLY=	Yes

COMMENT=	fast array facility to the Python language

VERSION=	23.1
DISTNAME=	Numeric-${VERSION}
PKGNAME=	py-${DISTNAME}
REVISION =	7
CATEGORIES=	math

HOMEPAGE=	http://people.csail.mit.edu/jrennie/python/numeric/

# Python License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		m

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=numpy/}

MODULES=	lang/python

do-regress:
	cd ${WRKSRC}/Test && ${MODPY_BIN} -i test.py

.include <bsd.port.mk>
