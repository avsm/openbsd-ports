# $OpenBSD: Makefile,v 1.11 2011/09/16 09:48:11 espie Exp $

COMMENT =		lightweight mapping application for use with or without GPS

DISTNAME =		tangogps-0.99.4
REVISION =		4

CATEGORIES =		geo

HOMEPAGE =		http://www.tangogps.org/

MASTER_SITES =		${HOMEPAGE}/downloads/

MAINTAINER =		Kirill Bychkov <yason@linklevel.net>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender c cairo crypto
WANTLIB += expat fontconfig freetype gcrypt gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gnutls
WANTLIB += gobject-2.0 gpg-error gthread-2.0 gtk-x11-2.0 idn m
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png pthread pthread-stubs ssl tasn1 xcb xcb-render
WANTLIB += xcb-render-util xml2 z GL X11-xcb Xxf86vm drm xcb-shm
WANTLIB += atk-1.0 curl exif gconf-2 sqlite3 soup-2.4

MODULES = 		devel/gettext
LIB_DEPENDS =		devel/atk \
			net/curl \
			graphics/libexif \
			devel/gconf2 \
			databases/sqlite3 \
			devel/libsoup \
			x11/gtk+2

RUN_DEPENDS = 		devel/desktop-file-utils

CONFIGURE_ENV += 	CPPFLAGS=-I${LOCALBASE}/include \
			LDFLAGS="-L${LOCALBASE}/lib -liconv -lintl"

FAKE_FLAGS+=		localedir="${PREFIX}/share/locale"


CONFIGURE_STYLE =	autoconf gnu
AUTOCONF_VERSION =	2.64
NO_REGRESS = 		Yes

.include <bsd.port.mk>
