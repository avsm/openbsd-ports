# $OpenBSD: Makefile,v 1.30 2011/09/28 09:47:46 jasper Exp $

COMMENT=		CD/DVD authoring application for GNOME

GNOME_PROJECT=		gnomebaker
GNOME_VERSION=		0.6.4

REVISION=		15

CATEGORIES=		sysutils multimedia

HOMEPAGE=		http://gnomebaker.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	ICE ORBit-2 SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp \
		Xext Xfixes Xi Xinerama Xrandr Xrender art_lgpl_2 atk-1.0 \
		bonobo-2 bonobo-activation bonoboui-2 c cairo \
		expat fontconfig freetype gailutil dbus-1 gio-2.0 \
		gconf-2 gdk-x11-2.0 gdk_pixbuf-2.0 glade-2.0 glib-2.0 \
		gmodule-2.0 gnome-2 gnome-keyring gnomecanvas-2 \
		gnomevfs-2 gobject-2.0 gthread-2.0 gtk-x11-2.0 m pango-1.0 \
		pangocairo-1.0 pangoft2-1.0 pixman-1 png popt pthread xml2 z \
		pthread-stubs xcb xcb-render xcb-render-util gstreamer-0.10 \
		gnomeui-2

MODULES=		devel/gettext \
			x11/gnome

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=gnomebaker/}
EXTRACT_SUFX=		.tar.gz

LIB_DEPENDS=		multimedia/gstreamer-0.10/core \
			x11/gnome/libgnomeui

RUN_DEPENDS=		misc/cdrdao \
			sysutils/cdrtools \
			sysutils/dvd+rw-tools

MODGNOME_DESKTOP_FILE=		Yes
MODGNOME_TOOLS= 	yelp

CONFIGURE_ARGS+=	--disable-libnotify

.if ${MACHINE_ARCH:Mamd64}
# XXX: See FreeBSD ports/130972
post-configure:
	perl -pi -e 's,\#define CAIRO_WIDGETS 1,,g' ${WRKSRC}/config.h
.endif

.include <bsd.port.mk>
