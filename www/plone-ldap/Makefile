# $OpenBSD: Makefile,v 1.6 2011/09/16 12:00:07 espie Exp $

COMMENT=	LDAP adapter for Plone

VERSION=	1.0
DISTNAME=	PloneLDAP-${VERSION}
PKGNAME=	${DISTNAME:S/Plone/plone-/:L}
REVISION=	1

CATEGORIES=	www
HOMEPAGE=	http://plone.org/products/ploneldap

# GPL v2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://www.etc.msys.ch/software/mirror/

MODULES=	www/zope
PY_FLAVOR=	python${MODZOPE_PYTHON_VERSION}

RUN_DEPENDS=	py-ldap-*-${PY_FLAVOR}:databases/py-ldap,${PY_FLAVOR} \
		www/zope-ldapmultiplugins

WRKDIST=	${WRKDIR}/PloneLDAP

do-install:
	${INSTALL_DATA_DIR} ${MODZOPE_PRODUCTSDIR}
	cd ${WRKDIR}; tar cf - PloneLDAP | tar xf - \
		-C ${MODZOPE_PRODUCTSDIR}

.include <bsd.port.mk>
