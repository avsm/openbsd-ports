# $OpenBSD: Makefile,v 1.31 2011/10/14 12:22:00 jasper Exp $

ONLY_FOR_ARCHS=	${APM_ARCHS}

COMMENT=	Xfce4 battery monitor panel plugin

XFCE_VERSION=	1.0.0
XFCE_PLUGIN=	battery
REVISION=	1

# BSD
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

MODULES=	x11/xfce4
LIB_DEPENDS =	x11/xfce4/libxfcegui4

WANTLIB=	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes \
		Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig \
		freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 \
		gmodule-2.0 gobject-2.0 gtk-x11-2.0 m pango-1.0 pthread-stubs xcb \
		pangocairo-1.0 pangoft2-1.0 pixman-1 png xfce4util xfcegui4 z \
		gthread-2.0 pthread xcb-render GL ICE SM Xxf86vm drm  \
		pcre startup-notification-1 X11-xcb ffi  xcb-aux xcb-shm


.include <bsd.port.mk>
