# $OpenBSD: Makefile,v 1.11 2011/09/28 09:51:36 jasper Exp $

COMMENT =	GPS track manager

DISTNAME =	viking-1.0.2
REVISION=		0

CATEGORIES =	geo x11

HOMEPAGE =	http://viking.sourceforge.net/
MAINTAINER =	Landry Breuil <gaston@gcu.info>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

EXTRACT_SUFX=		.tar.gz

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=viking/}

MODULES =	devel/gettext x11/gnome

CONFIGURE_STYLE =	gnu
MODGNOME_DESKTOP_FILE =		Yes
MODGNOME_TOOLS= 	yelp

MODGNOME_LDFLAGS=-pthread

LIB_DEPENDS =	misc/gpsd \
		net/curl \
		devel/libidn \
		x11/gtk+2
RUN_DEPENDS =	geo/gpsbabel

WANTLIB = gps curl idn gdk-x11-2.0 gtk-x11-2.0 gdk_pixbuf-2.0
WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo crypto expat
WANTLIB += fontconfig freetype gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 gthread-2.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pixman-1 png pthread pthread-stubs ssl
WANTLIB += GL Xxf86vm drm xcb-shm xcb xcb-render z

.include <bsd.port.mk>
