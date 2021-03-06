# $OpenBSD: Makefile,v 1.52 2011/09/28 09:51:36 jasper Exp $

# XXX fix building with glib2 >= 2.29 (G_CONST_RETURN is deprecated)
CFLAGS +=	"-DG_CONST_RETURN=const"

SHARED_ONLY=		Yes

COMMENT=		lightweight HTML rendering/printing/editing engine

GNOME_PROJECT=		gtkhtml
GNOME_VERSION=		3.32.2
API_VERSION=		3.14

PKGNAME=		gtkhtml3-${VERSION}

REVISION=		2

HOMEPAGE=		http://www.gnome.org/

SHARED_LIBS +=  gtkhtml-3.14         4.0      # 20.1
SHARED_LIBS +=  gtkhtml-editor-3.14  0.0      # unknown

CATEGORIES=    		www

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
			Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2/LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 c cairo
WANTLIB += expat fontconfig freetype gailutil gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gthread-2.0 gtk-x11-2.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre pixman-1 png pthread pthread-stubs
WANTLIB += stdc++ xcb xcb-render z gconf-2 enchant GL Xxf86vm
WANTLIB += drm xcb-shm

MODULES=		devel/gettext \
			x11/gnome

LIB_DEPENDS=		devel/gconf2 \
			textproc/enchant \
			x11/gtk+2

BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		devel/iso-codes \
			x11/gnome/icon-theme

CONFIGURE_STYLE=	gnu

SUBST_VARS=		API_VERSION

# Resolve conflict with gtkhtml4.
post-install:
	mv ${PREFIX}/bin/gtkhtml-editor-test ${PREFIX}/bin/gtkhtml3-editor-test

.include <bsd.port.mk>
