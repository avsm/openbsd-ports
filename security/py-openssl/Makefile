# $OpenBSD: Makefile,v 1.16 2011/09/16 11:41:39 espie Exp $

COMMENT=	Python interface to the OpenSSL library

MODPY_EGG_VERSION=	0.9
DISTNAME=	pyOpenSSL-${MODPY_EGG_VERSION}
PKGNAME=	py-openssl-${MODPY_EGG_VERSION}
REVISION=	2
CATEGORIES=	security devel

HOMEPAGE=	http://www.sourceforge.net/projects/pyopenssl/

MAINTAINER=	Eric Faurot <eric@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	crypto ssl

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=pyopenssl/}

MODULES=	lang/python

REGRESS_DEPENDS=devel/py-twisted/core

EXAMPLESDIR=	${PREFIX}/share/examples/py-openssl

post-install:
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}/simple
	${INSTALL_DATA} ${WRKSRC}/examples/README ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.py ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/simple/* ${EXAMPLESDIR}/simple

do-regress: install
	${LOCALBASE}/bin/trial --temp-directory=${WRKBUILD} OpenSSL.test

.include <bsd.port.mk>
