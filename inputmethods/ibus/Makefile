# $OpenBSD: Makefile,v 1.20 2011/09/16 10:02:38 espie Exp $

SHARED_ONLY =	Yes

COMMENT =	intelligent input bus framework

DISTNAME =	ibus-1.3.9
REVISION =	6

SHARED_LIBS =	ibus	1.0	# 2.0

CATEGORIES =	inputmethods chinese japanese korean

HOMEPAGE =	http://code.google.com/p/ibus/

# LGPLv2+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =	GL ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp \
		Xext Xfixes Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 \
		c cairo dbus-1 drm expat fontconfig freetype gdk-x11-2.0 \
		gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 \
		gthread-2.0 gtk-x11-2.0 m pango-1.0 pangocairo-1.0 \
		pangoft2-1.0 pcre pixman-1 png pthread pthread-stubs \
		xcb xcb-render xcb-shm z

MASTER_SITES =	http://ibus.googlecode.com/files/

MODULES =	devel/gconf2 \
		devel/gettext \
		lang/python \
		textproc/intltool

BUILD_DEPENDS =	devel/gobject-introspection \
		devel/iso-codes \
		x11/dbus-python \
		lang/vala
RUN_DEPENDS =	devel/iso-codes \
		devel/desktop-file-utils \
		devel/py-notify \
		devel/py-xdg \
		sysutils/gamin,-server,no_python \
		x11/dbus-python \
		x11/gnome/librsvg

LIB_DEPENDS =	x11/gtk+2

MODGCONF2_SCHEMAS_DIR = ibus

USE_GMAKE =	Yes
USE_LIBTOOL =	Yes
LIBTOOL_FLAGS =	--tag=disable-static

CONFIGURE_STYLE = gnu
CONFIGURE_ARGS = --enable-vala \
		 --enable-introspection \
		 --enable-gtk-doc-html=no
CONFIGURE_ENV =	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

FAKE_FLAGS=	xdgautostartdir=${PREFIX}/share/examples/ibus/xdg/autostart

.include <bsd.port.mk>
