# $OpenBSD: Makefile,v 1.53 2011/09/25 13:49:59 naddy Exp $

COMMENT=		Gtk-based GUI client for the Gnutella Network

DISTNAME=		gtk-gnutella-0.96.8
EPOCH=			0
CATEGORIES=     	net

HOMEPAGE=		http://gtk-gnutella.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += pthread-stubs xcb xml2 z gdk-x11-2.0 gdk_pixbuf-2.0
WANTLIB += gtk-x11-2.0 gthread-2.0 pthread xcb-render xcb-render-util

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=gtk-gnutella/}
EXTRACT_SUFX=	.tar.bz2

LIB_DEPENDS=	x11/gtk+2 \
		textproc/libxml
RUN_DEPENDS=	devel/desktop-file-utils

MODULES=	devel/gettext

CONFIGURE_STYLE= simple
CONFIGURE_SCRIPT=Configure
# -d don't run interactively
# -e fixes bulk package build
CONFIGURE_ARGS=	-d  -e \
		-D mansrc="${PREFIX}/man/man1" \
		-D prefix="${PREFIX}" \
		-D privlib="${PREFIX}/share/gtk-gnutella" \
		-D cc="${CC}" \
		-D ccflags="${CFLAGS} -I${LOCALBASE}/include" \
		-D gtkversion="2" \
		-D ldflags="-L${LOCALBASE}/lib -liconv" \
		-D official="true" \
		-D yacc="yacc" \
		-U d_dbus \
		-U d_gnutls \
		-U d_remotectrl \
		-U d_sqlite \
		-U optimize

MAKE_FLAGS=	GNUTLS_LDFLAGS= GNUTLS_CFLAGS=
DESTDIRNAME=	INSTALL_PREFIX
INSTALL_TARGET=	install install.man

USE_GROFF =	Yes
NO_REGRESS=	Yes

.include <bsd.port.mk>
