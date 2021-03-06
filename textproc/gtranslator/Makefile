# $OpenBSD: Makefile,v 1.21 2011/09/28 09:51:36 jasper Exp $

BROKEN=		does not compile with new libgda

SHARED_ONLY=	Yes

COMMENT=	gettext(1) files editor for GNOME

GNOME_PROJECT=	gtranslator
GNOME_VERSION=	1.9.13

REVISION=	5

CATEGORIES=	textproc devel

HOMEPAGE=	http://projects.gnome.org/gtranslator/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo dbus-1 dbus-glib-1
WANTLIB += enchant expat fontconfig freetype gcrypt gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 gpg-error gthread-2.0 gtk-x11-2.0 m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB += pthread-stubs stdc++ xcb xml2 z json-glib-1.0
WANTLIB += gettextpo gdl-1 gdict-1.0 gtksourceview-2.0 gtkspell
WANTLIB += gucharmap xcb-render gda-4.0 unique-1.0
WANTLIB += GL Xxf86vm drm gconf-2 gnome-keyring xcb-shm

MODULES=	devel/gettext \
		x11/gnome \
		devel/dconf

RUN_DEPENDS=	devel/gsettings-desktop-schemas
BUILD_DEPENDS=	${RUN_DEPENDS}

LIB_DEPENDS=	x11/gnome/gdl \
		x11/gnome/utils \
		x11/gtksourceview \
		textproc/gtkspell \
		gtk2:x11/gnome/gucharmap \
		x11/gnome/libgda \
		devel/libunique \
		devel/json-glib

MODGNOME_DESKTOP_FILE=	Yes
MODGNOME_TOOLS= 	yelp

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-gtkspell \
		--with-dictionary
MODGNOME_CPPFLAGS=-I${LOCALBASE}/include/db4
CONFIGURE_ENV=	LIBS="-liconv -lintl"
USE_GROFF =	Yes

.include <bsd.port.mk>
