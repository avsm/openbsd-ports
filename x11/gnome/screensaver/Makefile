# $OpenBSD: Makefile,v 1.40 2011/10/16 19:23:35 ajacoutot Exp $

COMMENT=	screen saver and locker for GNOME

GNOME_PROJECT=	gnome-screensaver
GNOME_VERSION=	3.2.0
REVISION=	2

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL ICE SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender Xss Xxf86misc
WANTLIB += Xxf86vm atk-1.0 c cairo cairo-gobject dbus-1 dbus-glib-1
WANTLIB += drm expat ffi fontconfig freetype gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gnome-desktop-3 gnomekbd
WANTLIB += gnomekbdui gobject-2.0 gthread-2.0 gtk-3 m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB += pthread-stubs xcb xcb-render xcb-shm xkbfile xklavier
WANTLIB += xml2 z

MODULES=	devel/gettext \
		x11/gnome \
		devel/dconf

BUILD_DEPENDS=	textproc/xmlto \
		devel/gsettings-desktop-schemas \
		${MODGNU_AUTOMAKE_DEPENDS}
LIB_DEPENDS=	x11/gnome/desktop>=3.2.0p0 \
		x11/gnome/libgnomekbd

RUN_DEPENDS=	devel/gsettings-desktop-schemas \
		sysutils/consolekit # src/gs-listener-dbus.c

AUTOCONF_VERSION= 2.68
AUTOMAKE_VERSION= 1.11

CONFIGURE_STYLE= autoconf
CONFIGURE_ARGS=	--localstatedir=/var \
		--enable-docbook-docs \
		--enable-locking \
		--with-x \
		--with-mit-ext \
		--with-xf86gamma-ext

MAKE_FLAGS=	DOCDIR="${PREFIX}/share/doc/gnome-screensaver"
FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/gnome-xscreensaver

post-extract:
	cp ${FILESDIR}/gs-auth-bsdauth.c ${WRKSRC}/src/

pre-configure:
	cd ${WRKSRC} && \
		AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} automake

.include <bsd.port.mk>
