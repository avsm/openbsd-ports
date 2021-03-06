# $OpenBSD: Makefile,v 1.26 2011/10/16 17:13:49 ajacoutot Exp $

SHARED_ONLY=	Yes

COMMENT=	monitor kerberos tickets

GNOME_PROJECT=	krb5-auth-dialog
GNOME_VERSION=	3.2.1

CATEGORIES=	security

HOMEPAGE=	https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += GL ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender Xxf86vm asn1
WANTLIB += atk-1.0 c cairo cairo-gobject crypto dbus-1 dbus-glib-1
WANTLIB += drm expat ffi fontconfig freetype gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gssapi gthread-2.0
WANTLIB += gtk-3 krb5 m notify pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pcre pixman-1 png pthread pthread-stubs xcb xcb-render
WANTLIB += xcb-shm z

MODULES=	devel/gettext \
		x11/gnome \
		devel/gconf2

LIB_DEPENDS=	x11/gtk+3 \
		devel/libnotify

MODGCONF2_SCHEMAS_DIR= krb5-auth-dialog
MODGNOME_TOOLS= yelp
MODGNOME_DESKTOP_FILE=	Yes

FAKE_FLAGS=	autostartdir=${PREFIX}/share/examples/krb5-auth-dialog/xdg/autostart \
		smallicondir=${PREFIX}/share/icons/hicolor/22x22/apps

CONFIGURE_ENV=	KRB5_CFLAGS="-I/usr/include/kerberosV" \
		KRB5_LIBS="-lgssapi -lkrb5 -lasn1 -lcrypto"
CONFIGURE_ARGS=	--disable-static \
		--with-gtk=3.0 \
		--enable-pkinit \
		--disable-network-manager \
		--without-pam

LIBTOOL_FLAGS=	--tag=disable-static

post-extract:
	${INSTALL} -m 555 ${FILESDIR}/krb5-config ${WRKDIR}/bin

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/krb5-auth-dialog
	${INSTALL_DATA} ${WRKSRC}/README \
		${PREFIX}/share/doc/krb5-auth-dialog

.include <bsd.port.mk>
