# $OpenBSD: Makefile,v 1.27 2011/09/28 09:51:36 jasper Exp $

COMMENT=	Settlers of Catan for GNOME/Gtk

GNOME_PROJECT=	pioneers
GNOME_VERSION=	0.12.3.1

CATEGORIES=	games

EXTRACT_SUFX=	.tar.gz

HOMEPAGE=	http://pio.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	ORBit-2 ORBitCosNaming-2 X11 Xau Xcomposite Xcursor \
		Xdamage Xdmcp Xext Xfixes Xi Xinerama Xrandr Xrender \
		atk-1.0 bonobo-2 bonobo-activation c cairo \
		crypto dbus-1 dbus-glib-1 expat fontconfig \
		freetype gconf-2 gdk-x11-2.0 gdk_pixbuf-2.0 glib-2.0 \
		gmodule-2.0 gnomevfs-2 gobject-2.0 gthread-2.0 \
		gtk-x11-2.0 m pango-1.0 pangocairo-1.0 pangoft2-1.0 \
		pcre pixman-1 png popt pthread ssl util xml2 z gio-2.0 \
		pthread-stubs xcb gnome-2>=1900 \
		GL Xxf86vm canberra drm ltdl ogg vorbis vorbisfile \
		xcb-render xcb-shm

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=pio/}

MODULES=	devel/gettext \
		x11/gnome

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	x11/gnome/librsvg
LIB_DEPENDS=	x11/gnome/libgnome

MODGNOME_DESKTOP_FILE=	Yes
MODGNOME_TOOLS= 	yelp

CONFIGURE_STYLE=gnu
USE_GROFF =	Yes
CONFIGURE_ENV=	ac_cv_path_pngtopnm=""
CONFIGURE_ARGS=	--enable-protocol=IPv4

pre-configure:
	@perl -pi -e 's,games/pioneers,pioneers,g;' \
		-e 's,/usr/share,${PREFIX}/share,g' \
		${WRKSRC}/client/help/C/pioneers-C.omf \
		${WRKSRC}/docs/pioneers.6 \
		${WRKSRC}/docs/pioneers-server-gtk.6 \
		${WRKSRC}/docs/pioneers-server-console.6 \
		${WRKSRC}/docs/pioneersai.6 \
		${WRKSRC}/docs/pioneers-meta-server.6

.include <bsd.port.mk>
