# $OpenBSD: Makefile,v 1.35 2011/09/16 11:41:40 espie Exp $

COMMENT=	gtk2 spelling checker
DISTNAME=	gtkspell-2.0.16
SHARED_LIBS=	gtkspell 1.0 # .0.0

REVISION=	3

CATEGORIES=	textproc x11

HOMEPAGE=	http://gtkspell.sourceforge.net/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}download/

WANTLIB=	X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes \
		Xi Xinerama Xrandr Xrender atk-1.0 cairo expat \
		fontconfig freetype glib-2.0 gmodule-2.0 \
		gobject-2.0 m pango-1.0 pangocairo-1.0 pangoft2-1.0 \
		pcre pixman-1 png pthread-stubs stdc++ xcb z gio-2.0 \
		gthread-2.0 xcb-render xcb-render-util gdk_pixbuf-2.0 \
		enchant>=5 gdk-x11-2.0 gtk-x11-2.0

USE_LIBTOOL=	Yes
USE_GMAKE=	Yes

MODULES=	devel/gettext \
		textproc/intltool

LIB_DEPENDS=	textproc/enchant \
		x11/gtk+2

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--disable-gtk-doc

.include <bsd.port.mk>
