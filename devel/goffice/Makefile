# $OpenBSD: Makefile,v 1.42 2011/09/28 09:51:35 jasper Exp $

# XXX on goffice version change,
# update API_VERSION in math/gnumeric, bump PKGNAME then change the
# goffice dependency spec according to the new version.

SHARED_ONLY=	Yes

COMMENT=	document centric objects and utilities

GNOME_PROJECT=	goffice
GNOME_VERSION=	0.8.17
REVISION =	0

SHARED_LIBS +=	goffice-0.8          0.0      # .8.0

CATEGORIES=	devel

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 bz2 cairo
WANTLIB += expat fontconfig freetype gconf-2
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 gthread-2.0 gtk-x11-2.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre pixman-1 png pthread-stubs xcb xml2
WANTLIB += z xcb-render gsf-1 gconf-2 GL Xxf86vm drm xcb-shm

MODULES=		devel/gettext \
			x11/gnome

LIB_DEPENDS=		devel/libgsf \
			devel/gconf2 \
			x11/gtk+2

CONFIGURE_STYLE=	gnu
MODGNOME_LDFLAGS=	-L${X11BASE}/lib

# XXX move to gsettings
CONFIGURE_ARGS +=	--with-config-backend=gconf

SUBST_VARS=		GNOME_VERSION

.include <bsd.port.mk>
