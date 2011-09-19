# $OpenBSD: xfce4.port.mk,v 1.14 2011/09/19 07:44:59 ajacoutot Exp $

# Module for Xfce related ports, divided into five categories:
# core, goodie, artwork, thunar plugins, panel plugins.

XFCE_DESKTOP_VERSION=	4.8.0
CATEGORIES+=	x11/xfce4

USE_GMAKE?=	Yes
EXTRACT_SUFX?=	.tar.bz2

# needed for all ports but *-themes
.if !defined(XFCE_NO_SRC)
USE_LIBTOOL?=	Yes
MODULES+=	devel/gettext textproc/intltool
.endif

# if version is not defined, it's the DE version
.if !defined(XFCE_VERSION)
XFCE_VERSION=	${XFCE_DESKTOP_VERSION}
.endif

XFCE_BRANCH=	${XFCE_VERSION:C/^([0-9]+\.[0-9]+).*/\1/}

# Set to 'yes' if there are .desktop files in share/applications/.
.if defined(MODGNOME_DESKTOP_FILE) && ${MODGNOME_DESKTOP_FILE:L} == "yes"
MODXFCE_RUN_DEPENDS+=	devel/desktop-file-utils
.endif

.if defined(XFCE_PLUGIN)
HOMEPAGE?=	http://goodies.xfce.org/projects/panel-plugins/xfce4-${XFCE_PLUGIN}-plugin

MASTER_SITES?=	http://archive.xfce.org/src/panel-plugins/xfce4-${XFCE_PLUGIN}-plugin/${XFCE_BRANCH}/
DISTNAME?=	xfce4-${XFCE_PLUGIN}-plugin-${XFCE_VERSION}
PKGNAME?=	${DISTNAME:S/-plugin//}

MODXFCE_LIB_DEPENDS=	x11/xfce4/xfce4-panel
MODXFCE_WANTLIB=	xfce4panel-1.0
.elif defined(XFCE_GOODIE)
HOMEPAGE?=	http://goodies.xfce.org/projects/applications/${XFCE_GOODIE}

MASTER_SITES?=	http://archive.xfce.org/src/apps/${XFCE_GOODIE:L}/${XFCE_BRANCH}/
DISTNAME=	${XFCE_GOODIE}-${XFCE_VERSION}
.elif defined(XFCE_ARTWORK)
HOMEPAGE?=	http://www.xfce.org/projects/

MASTER_SITES?=	http://archive.xfce.org/src/art/${XFCE_ARTWORK}/${XFCE_BRANCH}/
DISTNAME=	${XFCE_ARTWORK}-${XFCE_VERSION}
.elif defined(THUNAR_PLUGIN)
HOMEPAGE?=	http://goodies.xfce.org/projects/thunar-plugins/${THUNAR_PLUGIN}

MASTER_SITES?=	http://archive.xfce.org/src/thunar-plugins/${THUNAR_PLUGIN}/${XFCE_BRANCH}/
DISTNAME?=	${THUNAR_PLUGIN}-${XFCE_VERSION}
PKGNAME?=	${DISTNAME:S/-plugin//}
.elif defined(XFCE_PROJECT)
HOMEPAGE?=	http://www.xfce.org/projects/${XFCE_PROJECT}

MASTER_SITES?=	http://archive.xfce.org/src/xfce/${XFCE_PROJECT:L}/${XFCE_BRANCH}/
DISTNAME=	${XFCE_PROJECT}-${XFCE_VERSION}
.endif

LIB_DEPENDS+=	${MODXFCE_LIB_DEPENDS}
WANTLIB+=	${MODXFCE_WANTLIB}
RUN_DEPENDS+=	${MODXFCE_RUN_DEPENDS}
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
