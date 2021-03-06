# $OpenBSD: Makefile,v 1.41 2011/10/09 08:50:37 dcoppa Exp $

COMMENT=		fast, small, dynamic and awesome window manager

DISTNAME=		awesome-3.4.10
REVISION=		5
EXTRACT_SUFX=		.tar.bz2
CATEGORIES=		x11

HOMEPAGE=		http://awesome.naquadah.org/

MAINTAINER=		David Coppa <dcoppa@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB+=		GL Imlib2 X11 Xau Xdamage Xdmcp Xext Xfixes
WANTLIB+=		Xrender Xxf86vm c cairo dbus-1 drm ev
WANTLIB+=		execinfo expat fontconfig freetype glib-2.0
WANTLIB+=		gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB+=		lua m pango-1.0 pangocairo-1.0
WANTLIB+=		pangoft2-1.0 pixman-1 png pthread
WANTLIB+=		pthread-stubs startup-notification-1 xcb
WANTLIB+=		xcb-atom xcb-aux xcb-event xcb-icccm
WANTLIB+=		xcb-image xcb-keysyms xcb-property
WANTLIB+=		xcb-randr xcb-render xcb-shape xcb-shm
WANTLIB+=		xcb-xinerama xcb-xtest xdg-basedir z

MASTER_SITES=		${HOMEPAGE}download/

LIB_DEPENDS=		devel/libexecinfo \
			devel/pango \
			devel/libev \
			devel/startup-notification \
			graphics/imlib2 \
			lang/lua \
			x11/dbus \
			x11/libxdg-basedir

BUILD_DEPENDS=		devel/gperf \
			devel/luadoc \
			textproc/asciidoc>=8.4.5 \
			textproc/xmlto \
			graphics/ImageMagick \
			devel/doxygen

RUN_DEPENDS=		graphics/feh \
			misc/rlwrap \
			shells/bash

MODULES=		devel/cmake \
			devel/gettext

CONFIGURE_STYLE=	cmake

CONFIGURE_ARGS=		-DCOMPRESS_MANPAGES=off

NO_REGRESS=		Yes

post-install:
	@find ${WRKINST} -name '*.lua.in.orig' -print0 | xargs -0 rm
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/awesome
	@mv ${WRKINST}/${SYSCONFDIR}/xdg/awesome/rc.lua \
		${PREFIX}/share/examples/awesome/

.include <bsd.port.mk>
