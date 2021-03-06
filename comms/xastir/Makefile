# $OpenBSD: Makefile,v 1.23 2011/09/16 08:48:02 espie Exp $

COMMENT=	X amateur station tracking and info reporting

DISTNAME=	xastir-1.8.2
REVISION=	14
CATEGORIES=    	comms hamradio geo

HOMEPAGE=	http://www.xastir.org/

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	$(MASTER_SITE_SOURCEFORGE:=xastir/)

CONFIGURE_STYLE=	autoconf
AUTOCONF_VERSION=	2.59
AUTOMAKE_VERSION=	1.9
USE_GROFF =		Yes
MAKE_ENV+=MOTIFLIB='-L${LOCALBASE}/lib -lXm'

CONFIGURE_ARGS=		--with-shapelib					\
			--with-pcre					\
			--with-libproj					\
			--with-geotiff					\
			--with-dbfawk					\
			--with-rtree					\
			--with-map-cache				\
			--with-imagemagick				\
			--with-x					\
			--without-ax25					\
			--without-gpsman				\
			--without-festival				\
			--without-gdal					\
			--with-bdb-libdir=$(LOCALBASE)/lib/db4		\
			--with-bdb-incdir=$(LOCALBASE)/include/db4

WANTLIB += ICE SM c pthread freetype Xt Xpm Xext m X11 z proj
WANTLIB += tiff curl shp geotiff MagickCore>=1
WANTLIB += MagickWand>=1 lib/db4/db>=4 pcre Xm

MODULES=	devel/gettext

LIB_DEPENDS=	net/curl \
		devel/shapelib \
		devel/geotiff \
		graphics/ImageMagick \
		databases/db/v4 \
		devel/pcre \
		x11/openmotif

.include <bsd.port.mk>
