# $OpenBSD: Makefile,v 1.11 2011/09/16 09:48:09 espie Exp $

COMMENT=	French and Italian conjugation system

DISTNAME=	verbiste-0.1.33
REVISION=		0
SHARED_LIBS=	verbiste-0.1	4.0	# .0.0
CATEGORIES=	education
HOMEPAGE=	http://sarrazip.com/dev/verbiste.html

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://sarrazip.com/dev/

MODULES=	devel/gettext

BUILD_DEPENDS=	textproc/p5-XML-Parser
LIB_DEPENDS=	x11/gtk+2 \
		textproc/libxml

WANTLIB=	GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes \
		Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0 c cairo drm \
		expat fontconfig \
		freetype gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0 \
		gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 m \
		pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png \
		pthread-stubs stdc++ xcb z gthread-2.0 pthread xcb-render \
		xcb-shm xml2

USE_LIBTOOL=	Yes
USE_GROFF=	Yes
SEPARATE_BUILD=	simple
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} --enable-static \
		--with-gtk-app

MAKE_FLAGS=	INTLLIBS='$$(LTLIBINTL)'

.include <bsd.port.mk>
