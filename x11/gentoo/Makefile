# $OpenBSD: Makefile,v 1.22 2011/09/16 12:29:13 espie Exp $

COMMENT=		GTK+-2 Graphical filemanager

DISTNAME=		gentoo-0.15.6
REVISION=		4

CATEGORIES=		x11	

HOMEPAGE=		http://www.obsession.se/gentoo/

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=gentoo/}

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += pthread-stubs xcb z gdk_pixbuf-2.0 gdk-x11-2.0 gtk-x11-2.0
WANTLIB += GL Xxf86vm drm gthread-2.0 pthread xcb-render xcb-shm

MODULES=		devel/gettext

LIB_DEPENDS=		x11/gtk+2

CONFIGURE_STYLE=	gnu
NO_REGRESS=		Yes

pre-install:
	@chmod +x ${WRKSRC}/install-sh

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/gentoo.1x ${PREFIX}/man/man1/gentoo.1
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gentoo
.for i in gentoorc gentoogtkrc
	${INSTALL_DATA} ${WRKSRC}/$i ${PREFIX}/share/examples/gentoo
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/gentoo
	@cd ${WRKSRC}/docs && \
		tar cf - . | (cd ${PREFIX}/share/doc/gentoo; tar xf -) && \
		rm -f ${PREFIX}/share/doc/gentoo/gentoo.1x

.include <bsd.port.mk>
