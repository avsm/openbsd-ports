# $OpenBSD: Makefile,v 1.14 2011/09/28 09:51:37 jasper Exp $

COMMENT=	integration of xdg-user-dirs into GNOME/gtk+

GNOME_PROJECT=	xdg-user-dirs-gtk
GNOME_VERSION=	0.8
REVISION=	8

CATEGORIES=	x11 devel

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += pthread pthread-stubs xcb z gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB += gtk-x11-2.0

MODULES=	devel/gettext \
		x11/gnome

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	devel/xdg-user-dirs>=0.13p0
LIB_DEPENDS=	x11/gtk+2

CONFIGURE_STYLE=gnu
MODGNOME_LDFLAGS=-pthread

CFLAGS+=	-pthread

FAKE_FLAGS=	autostartdir=${PREFIX}/share/examples/xdg-user-dirs-gtk/xdg/autostart

.include <bsd.port.mk>
