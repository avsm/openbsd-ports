# $OpenBSD: Makefile,v 1.35 2011/09/16 09:48:10 espie Exp $

COMMENT=	gtk+ clone of the lines ball logic game

DISTNAME=	gtkballs-3.1.5
REVISION=	11
CATEGORIES=	games x11
MASTER_SITES=	${HOMEPAGE}dist/ \
		${MASTER_SITE_SUNSITE:=games/strategy/}

HOMEPAGE=	http://gtkballs.antex.ru/

MAINTAINER=	Peter Valchev <pvalchev@openbsd.org>

PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += pthread-stubs xcb z gdk_pixbuf-2.0 gdk-x11-2.0 gtk-x11-2.0

MODULES=	devel/gettext

LIB_DEPENDS=	x11/gtk+2

NO_REGRESS=	Yes
USE_GMAKE=	Yes
USE_GROFF =	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--localstatedir=${LOCALBASE}/share/examples
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
