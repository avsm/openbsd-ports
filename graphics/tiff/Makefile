# $OpenBSD: Makefile,v 1.41.2.1 2006/06/15 11:23:45 sturm Exp $

COMMENT=	"tools and library routines for working with TIFF images"

DISTNAME=	tiff-3.7.3
PKGNAME=	$(DISTNAME)p1
SHARED_LIBS=	tiff	37.3 \
		tiffxx	38.0
CATEGORIES=	graphics

MASTER_SITES=	ftp://ftp.remotesensing.org/pub/libtiff/ \
		ftp://ftp.remotesensing.org/pub/libtiff/old/

HOMEPAGE=	http://www.remotesensing.org/libtiff/

LIB_DEPENDS=	jpeg.62::graphics/jpeg
WANTLIB=	c m z
FAKE=		lib

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-docdir="${PREFIX}/share/doc/tiff" \
		--with-jpeg-include-dir="${DEPBASE}/include" \
		--with-jpeg-lib-dir="${DEPBASE}/lib" \
		--without-x
SEPARATE_BUILD=	simple

.include <bsd.port.mk>
