# $OpenBSD: Makefile,v 1.29 2011/09/16 10:02:38 espie Exp $

COMMENT=	flash rendering library

DISTNAME=	swfdec-0.8.4
REVISION=	4
SHARED_LIBS +=	swfdec-0.8           0.0      # .90.0
SHARED_LIBS +=	swfdec-gtk-0.8       0.0      # .90.0
CATEGORIES=	graphics

HOMEPAGE=	http://swfdec.freedesktop.org/

# LGPLv2.1
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

MASTER_SITES=		${HOMEPAGE}download/swfdec/0.8/

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig
WANTLIB += freetype gcrypt gdk_pixbuf-2.0 gdk-x11-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gnutls gobject-2.0 gpg-error
WANTLIB += gstpbutils-0.10 gstreamer-0.10 gthread-2.0 gtk-x11-2.0
WANTLIB += m oil-0.3 pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre
WANTLIB += pixman-1 png pthread-stubs sndio soup-2.4 tasn1 xcb
WANTLIB += xcb-render xcb-render-util xml2 z

LIB_DEPENDS=	devel/libsoup \
		devel/liboil \
		multimedia/gstreamer-0.10/plugins-base \
		x11/gtk+2

RUN_DEPENDS=	multimedia/gstreamer-0.10/plugins-bad \
		multimedia/gstreamer-0.10/plugins-ugly \
		multimedia/gstreamer-0.10/plugins-ffmpeg
MODULES=	devel/gettext

USE_LIBTOOL=		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-audio=sndio \
			--enable-gtk \
			--enable-gstreamer
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			PKG_CONFIG_PATH="${LOCALBASE}/lib/pkgconfig"

AUTOCONF_VERSION=	2.61
AUTOMAKE_VERSION=	1.9
BUILD_DEPENDS=		${MODGNU_AUTOCONF_DEPENDS} \
			${MODGNU_AUTOMAKE_DEPENDS} \
			devel/libtool #XXX needs libtoolize

post-patch:
	@cp ${FILESDIR}/swfdec_playback_sndio.c ${WRKSRC}/swfdec-gtk/
	@cd ${WRKSRC} && AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoreconf -i -f

.include <bsd.port.mk>
