# $OpenBSD: Makefile,v 1.25 2011/10/06 10:58:12 dcoppa Exp $

SHARED_ONLY =	Yes

COMMENT =	beautiful glass-like GTK+ 2.x engine and themes

VERSION =	0.98.1.1
DISTNAME =	murrine-${VERSION}
PKGNAME =	gtk2-murrine-engine-${VERSION}
REVISION=	2
CATEGORIES =	x11

HOMEPAGE =	http://cimitan.com/murrine/

MAINTAINER =	David Coppa <dcoppa@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes 
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_GNOME:=sources/murrine/${VERSION:C/^([0-9]+\.[0-9]+).*/\1/}/}
MASTER_SITES0 =	${HOMEPAGE}files/
DIST_SUBDIR =	murrine
DISTFILES =	${DISTNAME}.tar.bz2 \
		MurrinaBlu-0.32.tar.gz:0 \
		MurrineThemePack.tar.bz2:0 \
		MurrinaBlue.tar.bz2:0 \
		MurrinaChrome.tar.gz:0 \
		MurrinaCream.tar.gz:0 \
		MurrinaCandido.tar.gz:0 \
		MurrinaOranche_02.tar.gz:0 \
		MurrinaElement.tar.gz:0 \
		MurrinaFancyCandy.tar.bz2:0 \
		MurrinaOransun.tar.gz:0 \
		MurrinaTango.tar.bz2:0 \
		MurrinaVerdeOlivo.tar.bz2:0 \
		MurrinaAquaIsh.tar.bz2:0 \
		MurrinaGilouche.tar.bz2:0 \
		MurrinaLoveGray.tar.bz2:0

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png z pthread-stubs xcb gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0
WANTLIB += gthread-2.0 xcb-render xcb-render-util
WANTLIB += GL X11-xcb Xxf86vm drm xcb-shm

MODULES =	devel/gettext \
		textproc/intltool

LIB_DEPENDS =	x11/gtk+2

USE_LIBTOOL =	Yes
USE_GMAKE =	Yes

LIBTOOL_FLAGS =	--tag=disable-static
CONFIGURE_STYLE =gnu 
CONFIGURE_ENV =	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS = ${CONFIGURE_SHARED} \
		--disable-static \
		--enable-animation \
		--disable-rgba

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/themes/
	cp -R ${WRKDIR}/Murrina* ${PREFIX}/share/themes/
	@chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/themes/*
# Fix numerous warnings triggered by outdated configuration options:
# https://bugs.launchpad.net/ubuntu/+source/murrine-themes/+bug/584941
	perl -pi -e 's/scrollbar_color.*=.*// ; s/hilight_ratio/hilight_shade/; s/gradients.*=.*//' \
		${PREFIX}/share/themes/*/gtk-2.0/gtkrc

.include <bsd.port.mk>
