# $OpenBSD: Makefile,v 1.26 2011/09/28 09:51:35 jasper Exp $

COMMENT=	GNOME multimode HF terminal

GNOME_PROJECT=	gmfsk
GNOME_VERSION=	0.6
REVISION=	17
CATEGORIES=    	comms hamradio

HOMEPAGE=	http://gmfsk.connect.fi/
MASTER_SITES=	${HOMEPAGE}	\
		http://he.fi/pub/ham/unix/linux/hfmodems/
EXTRACT_SUFX=	.tar.gz

# GPLv2 - FDL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += ICE ORBit-2 SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender art_lgpl_2 atk-1.0
WANTLIB += bonobo-2 bonobo-activation bonoboui-2 c cairo dbus-1
WANTLIB += expat fontconfig freetype gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gnome-2 gnome-keyring gnomecanvas-2
WANTLIB += gnomevfs-2 gobject-2.0 gthread-2.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pixman-1 png popt pthread pthread-stubs sndio
WANTLIB += stdc++ xcb xcb-render xcb-render-util xml2 z
WANTLIB += fftw>=2 gailutil gtk-x11-2.0 gdk_pixbuf-2.0 gdk-x11-2.0
WANTLIB += hamlib>=2 gnomeui-2

MODULES=		devel/gettext \
			x11/gnome \
			devel/gconf2

MODGNOME_TOOLS= 	yelp
USE_GMAKE=		No
MODGCONF2_SCHEMAS_DIR=	gmfsk

BUILD_DEPENDS=		textproc/rarian
LIB_DEPENDS=		comms/hamlib \
			math/fftw \
			x11/gtk+2 \
			x11/gnome/libgnomeui

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--enable-hamlib
CONFIGURE_ENV=		LIBS="-lsndio"

.include <bsd.port.mk>
