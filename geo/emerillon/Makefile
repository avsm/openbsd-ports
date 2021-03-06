# $OpenBSD: Makefile,v 1.15 2011/09/28 09:51:36 jasper Exp $

# XXX fix building with glib2 >= 2.29 (G_CONST_RETURN is deprecated)
CFLAGS +=		"-DG_CONST_RETURN=const"

COMMENT =	map viewer using Openstreetmap data

GNOME_VERSION =	0.1.2
GNOME_PROJECT =	emerillon
REVISION=	5

CATEGORIES =	geo x11

HOMEPAGE =	http://projects.gnome.org/emerillon/
MAINTAINER =	Landry Breuil <gaston@gcu.info>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

EXTRACT_SUFX=		.tar.bz2

CONFIGURE_STYLE =	gnu
MODGNOME_DESKTOP_FILE =		yes

MODULES=	devel/gettext \
		x11/gnome \
		devel/gconf2

AUTOCONF_VERSION=	2.65
CONFIGURE_STYLE=	autoconf
MODGCONF2_SCHEMAS_DIR=	emerillon

MODGNOME_TOOLS= 	goi vala yelp

LIB_DEPENDS =	geo/libchamplain/core>=0.8.0 \
		devel/ethos \
		geo/geoclue \
		net/librest>=0.7.9

WANTLIB += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo
WANTLIB += clutter-glx-1.0 clutter-gtk-0.10 expat fontconfig freetype
WANTLIB += gcrypt gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gnutls gobject-2.0 gpg-error gthread-2.0
WANTLIB += gtk-x11-2.0 json-glib-1.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre pixman-1 png pthread pthread-stubs
WANTLIB += soup-2.4 sqlite3 tasn1 xcb xml2 z ethos-1.0 ethos-ui-1.0
WANTLIB += proxy ORBit-2 Xxf86vm dbus-1 dbus-glib-1 drm gnome-keyring
WANTLIB += champlain-0.8 champlain-gtk-0.8 soup-gnome-2.4
WANTLIB += geoclue rest-0.7 xcb-render xcb-shm

.include <bsd.port.mk>
