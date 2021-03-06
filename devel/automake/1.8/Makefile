# $OpenBSD: Makefile,v 1.14 2011/06/20 20:28:44 robert Exp $

COMMENT=	GNU standards-compliant Makefile generator

VERSION=	1.8
DISTNAME=	automake-${VERSION}.5
REVISION=	5
PKGSPEC =	automake->=${VERSION},<1.9

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU:=automake/}

HOMEPAGE=	http://www.gnu.org/software/automake/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

AUTOCONF_VERSION=	2.59

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS=		${MODGNU_AUTOCONF_DEPENDS}

SUFFIX=			-${VERSION}
CONFIGURE_STYLE=	gnu
CONFIGURE_ENV +=	AUTOCONF_VERSION=${AUTOCONF_VERSION}
MAKE_FLAGS+=		MAKEINFO="makeinfo --no-split" \
			pkgvdatadir=${PREFIX}/share/automake${SUFFIX} \
			APIVERSION=${VERSION}
SUBST_VARS=		SUFFIX

REGRESS_DEPENDS=	${MODGNU_AUTOCONF_DEPENDS} \
			devel/libtool
REGRESS_FLAGS=		AUTOCONF_VERSION=${AUTOCONF_VERSION}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/doc/automake.texi

post-install:
	cd ${PREFIX}/info && mv automake.info automake${SUFFIX}.info

.include <bsd.port.mk>
