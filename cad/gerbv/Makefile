# $OpenBSD: Makefile,v 1.15 2011/09/16 08:48:02 espie Exp $

COMMENT=		viewer for Gerber (RS-274X) files
DISTNAME=		gerbv-2.5.0
CATEGORIES=		cad graphics
REVISION =		0

HOMEPAGE=		http://gerbv.gpleda.org/

MAINTAINER=		Andreas Bihlmaier <andreas.bihlmaier@gmx.de>

SHARED_LIBS +=  gerbv                     0.1 # 1.5

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes
WANTLIB += Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += pthread-stubs xcb z
WANTLIB += gthread-2.0 pcre pthread xcb-render xcb-render-util
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=gerbv/}

MODULES=		devel/gettext

BUILD_DEPENDS=		shells/bash
LIB_DEPENDS=		x11/gtk+2
RUN_DEPENDS=		devel/desktop-file-utils

USE_LIBTOOL =		Yes
USE_GROFF =		Yes
CONFIGURE_STYLE=	gnu

pre-configure:
	${SUBST_CMD} ${WRKSRC}/icon-theme-installer

.include <bsd.port.mk>
