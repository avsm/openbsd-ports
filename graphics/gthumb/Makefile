# $OpenBSD: Makefile,v 1.48 2011/10/15 16:19:15 jasper Exp $

COMMENT=	image viewer and browser for GNOME

GNOME_PROJECT=	gthumb
GNOME_VERSION=	2.12.4

CATEGORIES=	graphics

HOMEPAGE=	http://live.gnome.org/gthumb

MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0
WANTLIB += c cairo dbus-1 dbus-glib-1 drm expat fontconfig freetype
WANTLIB += gcrypt gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gnome-keyring gobject-2.0 gpg-error
WANTLIB += gstreamer-0.10 gthread-2.0 gtk-x11-2.0 jpeg m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB += pthread-stubs tiff xcb xcb-render sqlite3
WANTLIB += xml2 z unique-1.0 gstinterfaces-0.10 soup-gnome-2.4 soup-2.4
WANTLIB += json-glib-1.0 stdc++ xcb-shm cairo-gobject ffi
WANTLIB += clutter-glx-1.0 clutter-gtk-0.10 exiv2

MODULES=	x11/gnome \
		devel/gettext \
		devel/gconf2

LIB_DEPENDS=	devel/json-glib \
		devel/libsoup,-gnome \
		devel/libunique \
		graphics/clutter/clutter-gtk \
		graphics/exiv2 \
		multimedia/gstreamer-0.10/plugins-base \
		databases/sqlite3
RUN_DEPENDS=	misc/shared-mime-info

MODGNOME_TOOLS= 	yelp
MODGNOME_DESKTOP_FILE=	Yes
MODGCONF2_SCHEMAS_DIR=	gthumb

CONFIGURE_STYLE=gnu
MODGNOME_CPPFLAGS=	-I${X11BASE}/include
MODGNOME_LDFLAGS=	-L${X11BASE}/lib
CONFIGURE_ARGS=	--disable-libopenraw \
		--disable-libbrasero \
		--enable-libsoup \
		--enable-gnome-keyring \
		--enable-exiv2

.include <bsd.port.mk>
