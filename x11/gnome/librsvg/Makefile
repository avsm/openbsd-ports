# $OpenBSD: Makefile,v 1.70 2011/09/28 09:47:47 jasper Exp $

COMMENT=	SAX-based render library for SVG files

GNOME_PROJECT=	librsvg
GNOME_VERSION=	2.34.1

SHARED_LIBS +=	rsvg-2         28.0           # .34.0

CATEGORIES=	devel

# GPLv2/LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL X11 Xau Xdamage Xdmcp Xext Xfixes Xrender Xxf86vm
WANTLIB += c cairo croco-0.6 drm expat fontconfig freetype gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png pthread pthread-stubs xcb xcb-render xcb-shm xml2
WANTLIB += z

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	graphics/gdk-pixbuf2 \
		devel/pango \
		www/libcroco

CONFIGURE_ARGS=	--disable-gtk-theme \
		--with-svgz \
		--with-croco

.include <bsd.port.mk>
