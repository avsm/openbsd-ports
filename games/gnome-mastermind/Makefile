# $OpenBSD: Makefile,v 1.14 2011/09/28 09:51:36 jasper Exp $

COMMENT =	Mastermind clone reflexion game

GNOME_PROJECT =	gnome-mastermind
GNOME_VERSION =	0.3.1
REVISION=	4

CATEGORIES =	games

HOMEPAGE =	http://www.autistici.org/gnome-mastermind/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	http://download.gna.org/gnome-mastermind/
EXTRACT_SUFX=		.tar.bz2

MODULES =	devel/gettext \
		x11/gnome

MODGNOME_DESKTOP_FILE =	Yes
LIB_DEPENDS =	x11/gtk+2 \
		devel/gconf2
RUN_DEPENDS +=	x11/gnome/librsvg

MODGNOME_TOOLS= 	yelp
CONFIGURE_STYLE =	gnu

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 c cairo dbus-1
WANTLIB += dbus-glib-1 expat fontconfig freetype gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 gthread-2.0 m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB += pthread-stubs xcb z gdk_pixbuf-2.0 gdk-x11-2.0>=1000
WANTLIB += gtk-x11-2.0>=1000 gconf-2>=6

.include <bsd.port.mk>
