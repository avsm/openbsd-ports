# $OpenBSD: Makefile,v 1.7.2.1 2010/01/06 01:30:23 william Exp $

COMMENT=	high-level Python web framework

V=			1.0.2
MODPY_EGG_VERSION=	${V}-final
LNAME=			django
DISTNAME=		Django-${MODPY_EGG_VERSION}
PKGNAME=		py-${LNAME}-${V}p0
CATEGORIES=		www

HOMEPAGE=	http://www.djangoproject.com/

MAINTAINER=	Ryan Boggs <rmboggs@gmail.com>

# BSD License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://media.djangoproject.com/releases/${V}/

MODULES=	lang/python

NO_REGRESS=	Yes

SUBST_VARS+=	V LNAME

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${LNAME}
	cd ${WRKSRC}/docs && \
		find . ! -type d -exec ${INSTALL_DATA} {} ${PREFIX}/share/doc/${LNAME}/{} \;

.include <bsd.port.mk>
