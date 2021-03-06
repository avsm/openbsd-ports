# $OpenBSD: Makefile,v 1.11 2011/09/16 09:48:10 espie Exp $

COMMENT =	Openstreetmap editor for handheld devices

VERSION =	0.7.22
DISTNAME =	osm2go_${VERSION}-maemo1
PKGNAME =	osm2go-${VERSION}
REVISION=	4

WRKDIST =	${WRKDIR}/osm2go-${VERSION}
CATEGORIES =	geo x11

HOMEPAGE =	http://wiki.openstreetmap.org/wiki/Osm2go

# GPLv3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	http://repository.maemo.org/extras-devel/pool/diablo/free/source/o/osm2go/

CONFIGURE_STYLE =	gnu

MODULES =	devel/gettext \
		devel/gconf2

LIB_DEPENDS =	x11/gnome/libgnome \
		devel/libsoup \
		net/curl \
		graphics/goocanvas

RUN_DEPENDS =	devel/desktop-file-utils

WANTLIB += ORBit-2 X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 bonobo-2
WANTLIB += bonobo-activation c cairo expat fontconfig freetype
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gnutls gobject-2.0 gthread-2.0 gtk-x11-2.0 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pixman-1 png popt pthread pthread-stubs
WANTLIB += xcb xml2 z gnomevfs-2 xcb-render GL Xxf86vm canberra drm xcb-shm
WANTLIB += gnome-2 soup-2.4 curl goocanvas

pre-configure:
	${SUBST_CMD} ${WRKSRC}/data/osm2go-ubuntu.desktop

.include <bsd.port.mk>
