# $OpenBSD: Makefile,v 1.34 2011/10/14 11:37:24 jasper Exp $

COMMENT=	Xfce4 theme engine for Gtk+2

XFCE_PROJECT=	gtk-xfce-engine
XFCE_VERSION=	2.8.1
REVISION=	1

HOMEPAGE=	http://www.xfce.org/projects/

# GPLv2
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

MODULES=	x11/xfce4

LIB_DEPENDS=	x11/gtk+2

WANTLIB=	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes GL Xxf86vm drm xcb-shm \
		Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig \
		freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 m pango-1.0 \
		pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png z pthread-stubs xcb \
		gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0 gthread-2.0 xcb-render ffi

.include <bsd.port.mk>
