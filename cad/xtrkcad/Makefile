# $OpenBSD: Makefile,v 1.5 2011/05/16 08:24:31 ajacoutot Exp $

COMMENT=	CAD program for designing model railroad layouts

VERSION=	4.0.3a
DISTNAME=	xtrkcad-source-${VERSION}
PKGNAME=	xtrkcad-${VERSION}
CATEGORIES=	cad
REVISION=	1

HOMEPAGE=	http://www.xtrkcad.org/

MAINTAINER=	Sebastian Reitenbach <sebastia@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xtrkcad-fork/}

MODULES=	devel/cmake devel/gettext

WANTLIB += GL X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender Xxf86vm c drm expat fontconfig
WANTLIB += freetype m pixman-1 pthread pthread-stubs xcb xcb-render
WANTLIB += xcb-shm z cairo png webkitgtk-1.0 soup-2.4 xml2
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += atk-1.0 gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0 pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0

LIB_DEPENDS=	www/webkit>=1.4.0v0

CONFIGURE_STYLE=cmake
CONFIGURE_ENV+=	CFLAGS=-I${PREFIX}/include \
		LDFLAGS="-pthread -L${PREFIX}/lib -liconv -lintl"

.include <bsd.port.mk>
