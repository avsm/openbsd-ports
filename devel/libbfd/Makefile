# $OpenBSD: Makefile,v 1.6 2011/09/27 21:38:42 sthen Exp $

COMMENT=	GNU Binary File Descriptor library

VER=		2.20
DISTNAME=	binutils-${VER}
PKGNAME=	libbfd-${VER}
REVISION=	1
EXTRACT_SUFX=	.tar.bz2

HOMEPAGE=	http://www.gnu.org/software/binutils/
CATEGORIES=	devel
MAINTAINER=	Chris Kuethe <ckuethe@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

WANTLIB=		c

CONFIGURE_STYLE=gnu
MASTER_SITES=	${MASTER_SITE_GNU:=binutils/}

USE_LIBTOOL=	Yes
LIBTOOL_FLAGS=	--tag=disable-shared
CONFIGURE_ARGS+= --disable-nls \
		--disable-shared \
		--disable-werror

WRKSRC=${WRKDIR}/${DISTNAME}/bfd

.include <bsd.port.mk>
