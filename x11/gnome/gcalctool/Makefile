# $OpenBSD: Makefile,v 1.55 2011/10/17 14:01:54 ajacoutot Exp $

COMMENT=		GTK desktop calculator

GNOME_PROJECT=		gcalctool
GNOME_VERSION=		6.2.0
REVISION=		0

CATEGORIES=		math

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 c cairo cairo-gobject expat
WANTLIB += fontconfig freetype gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 gthread-2.0 gtk-3 m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pixman-1 png pthread pthread-stubs
WANTLIB += xcb xcb-render xcb-shm xml2 z

MODULES=		devel/gettext \
			x11/gnome \
			devel/dconf

LIB_DEPENDS+=		x11/gtk+3

# needed to download IMF/ECB rates (Financial mode)
RUN_DEPENDS=		x11/gnome/gvfs

MODGNOME_TOOLS= 	yelp
MODGNOME_DESKTOP_FILE=	Yes

.include <bsd.port.mk>
