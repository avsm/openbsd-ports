# $OpenBSD: Makefile,v 1.29 2011/09/16 11:41:39 espie Exp $

COMMENT=	network security scanner
DISTNAME=	nessus-core-${V}
REVISION=	9

FLAVORS=	no_x11
FLAVOR?=

WANTLIB += c crypto hosts_gatherer m nessus pcap rpcsvc ssl util nasl>=4

LIB_DEPENDS=	security/nessus/libnasl
BUILD_DEPENDS=	devel/bison
USE_GROFF =	Yes

.if empty(FLAVOR:L:Mno_x11)
MODULES=	devel/gettext
WANTLIB += 	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += 	Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig
WANTLIB += 	freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += 	gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0 gthread-2.0
WANTLIB += 	pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += 	pthread pthread-stubs xcb xcb-render xcb-render-util z
LIB_DEPENDS+=	x11/gtk+2
CONFIGURE_ARGS+=--enable-gtk
.else
CONFIGURE_ARGS+=--disable-gtk
.endif

.include <bsd.port.mk>
