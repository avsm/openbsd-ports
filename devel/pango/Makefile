# $OpenBSD: Makefile,v 1.59 2011/09/28 15:29:48 ajacoutot Exp $

COMMENT=		library for layout and rendering of text

GNOME_VERSION=		1.29.4
GNOME_PROJECT=		pango

SHARED_LIBS +=  pango-1.0            2903.0   # 2903.0
SHARED_LIBS +=  pangox-1.0           2903.0   # 2903.0
SHARED_LIBS +=  pangoft2-1.0         2903.0   # 2903.0
SHARED_LIBS +=  pangoxft-1.0         2903.0   # 2903.0
SHARED_LIBS +=  pangocairo-1.0       2903.0   # 2903.0

CATEGORIES=		devel x11

HOMEPAGE=		http://www.gtk.org/

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL X11 Xau Xdamage Xdmcp Xext Xfixes Xft Xrender Xxf86vm
WANTLIB += c cairo drm expat ffi fontconfig freetype glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 gthread-2.0 m pcre pixman-1
WANTLIB += png pthread pthread-stubs xcb xcb-render xcb-shm z

MODULES=		devel/gettext \
			x11/gnome

MODGNOME_TOOLS=		goi
MODGNOME_CPPFLAGS=	-I${X11BASE}/include

LIB_DEPENDS=		devel/glib2>=2.29.92 \
			graphics/cairo

CONFIGURE_STYLE=	gnu

FAKE_FLAGS=		aliasdir=${PREFIX}/share/examples/pango \
			sysconfdir=${PREFIX}/share/examples

.include <bsd.port.mk>
