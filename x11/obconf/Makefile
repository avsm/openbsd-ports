# $OpenBSD: Makefile,v 1.26 2011/09/16 12:29:16 espie Exp $

COMMENT=	configuration utility for openbox

DISTNAME=	obconf-2.0.3
REVISION=	9
CATEGORIES=	x11

HOMEPAGE=	http://icculus.org/openbox/index.php/Obconf

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://icculus.org/openbox/obconf/

WANTLIB=	ICE SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext \
		Xfixes Xft Xi Xinerama Xrandr Xrender atk-1.0 c cairo \
		expat fontconfig freetype gio-2.0 glib-2.0 gmodule-2.0 \
		gobject-2.0 gthread-2.0 m pango-1.0 pangocairo-1.0 \
		pangoft2-1.0 pangoxft-1.0 pixman-1 png pthread pthread-stubs \
		xcb xcb-render xcb-render-util xml2 z gdk-x11-2.0 \
		gdk_pixbuf-2.0 gtk-x11-2.0 glade-2.0 startup-notification-1 \
		obparser obrender

MODULES=	devel/gettext
LIB_DEPENDS=	x11/gtk+2 \
		devel/libglade2 \
		devel/startup-notification \
		x11/openbox
RUN_DEPENDS=	devel/desktop-file-utils \
		misc/shared-mime-info>=0.21

USE_GMAKE=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
