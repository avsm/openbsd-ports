# $OpenBSD: Makefile,v 1.8 2011/09/28 09:47:47 jasper Exp $

COMMENT=		Javascript bindings for GNOME

GNOME_PROJECT=		gjs
GNOME_VERSION=		1.30.0

SHARED_LIBS +=  gjs                  1.0      # 0.0
SHARED_LIBS +=  gjs-dbus             1.0      # 0.0
SHARED_LIBS +=  gjs-gdbus             1.0      # 0.0

CATEGORIES=		devel

HOMEPAGE=		http://live.gnome.org/Gjs

# MIT
# console modules (modules/console.c) and stack printer (gjs/stack.c)
# contain code from Mozilla which are: MPL1.1/LGPLv2+/GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=		devel/gettext \
			lang/python \
			x11/gnome

MODPY_RUNDEP=		No
MODPY_BUILDDEP= 	Yes # scripts/make-tests needs python to run.
MODPY_ADJ_FILES=	scripts/make-tests

LIBTOOL_FLAGS=		--tag=disable-static

WANTLIB += GL X11 Xau Xdamage Xdmcp Xext Xfixes Xrender Xxf86vm
WANTLIB += c cairo cairo-gobject dbus-1 dbus-glib-1 drm expat
WANTLIB += ffi fontconfig freetype gio-2.0 girepository-1.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 gthread-2.0 m mozjs ncurses
WANTLIB += ncursesw nspr4 pcre pixman-1 plc4 plds4 png pthread
WANTLIB += pthread-stubs readline stdc++ xcb xcb-render xcb-shm
WANTLIB += z

LIB_DEPENDS=		devel/gobject-introspection>=1.30.0 \
			lang/spidermonkey \
			x11/dbus-glib
REGRESS_DEPENDS=	sysutils/e2fsprogs

CONFIGURE_ARGS+=	--with-js-package="mozilla-js"

pre-configure:
	@perl -pi -e 's,%%LOCALBASE%%,${LOCALBASE},' ${WRKSRC}/configure

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gjs/
	${INSTALL_DATA} ${WRKSRC}/examples/* ${PREFIX}/share/examples/gjs/

.include <bsd.port.mk>
