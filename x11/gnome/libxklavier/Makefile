# $OpenBSD: Makefile,v 1.36 2011/09/28 09:47:47 jasper Exp $

COMMENT=		utility library for XKB

GNOME_PROJECT=		libxklavier
GNOME_VERSION=		5.1

REVISION=		2

SHARED_LIBS +=  xklavier             17.0     # .17.0

HOMEPAGE=		http://www.freedesktop.org/wiki/Software/LibXklavier

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += X11 Xau Xdmcp Xext Xi m pcre xkbfile z
WANTLIB += pthread-stubs xcb glib-2.0 gthread-2.0 gobject-2.0 xml2

MODULES=		devel/gettext \
			x11/gnome

BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		devel/iso-codes
LIB_DEPENDS=		devel/glib2 \
			textproc/libxml

CONFIGURE_ARGS+=	--with-xkb-base="${X11BASE}/share/X11/xkb/" \
			--with-xkb-bin-base="${X11BASE}/bin/" \
			--with-xmodmap-base="/usr/share/xmodmap"
MODGNOME_CPPFLAGS=	-I${X11BASE}/include

.include <bsd.port.mk>
