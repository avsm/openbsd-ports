# $OpenBSD: Makefile,v 1.51 2011/09/28 09:51:36 jasper Exp $

SHARED_ONLY=		Yes

COMMENT=		collection of theme engines for GTK+2

GNOME_PROJECT=		gtk-engines
GNOME_VERSION=		2.20.2

# warning: PKGNAME does not default to ${DISTNAME}
PKGNAME=		gtk-engines2-${GNOME_VERSION}
REVISION=		2

CATEGORIES=		x11

HOMEPAGE=		http://www.gnome.org/

# LGPLv2.1/GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB=	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes \
		Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig \
		freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 m \
		pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png z pcre \
		pthread-stubs xcb xcb-render xcb-render-util gdk-x11-2.0 \
		gdk_pixbuf-2.0 gthread-2.0 gtk-x11-2.0

LIB_DEPENDS=	x11/gtk+2
RUN_DEPENDS=	x11/hicolor-icon-theme

MODULES=		devel/gettext \
			x11/gnome

LIBTOOL_FLAGS=		--tag=disable-static

CONFIGURE_STYLE= 	gnu
CONFIGURE_ARGS= 	--disable-static \
			--disable-lua \
			--enable-animation

# nm: unknown option -- D
NO_REGRESS=	       Yes

.include <bsd.port.mk>
