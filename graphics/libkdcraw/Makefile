# $OpenBSD: Makefile,v 1.10 2011/09/16 10:02:37 espie Exp $

COMMENT =	grab raw data from digital cameras

DISTNAME =	libkdcraw-0.1.9
REVISION =	1
CATEGORIES =	graphics devel

HOMEPAGE =	http://www.kipi-plugins.org/drupal/
MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=kipi/}
EXTRACT_SUFX =	.tar.bz2

SHARED_LIBS +=		kdcraw               2.0      # .3.0
MODULES =		devel/gettext \
			x11/kde
MODKDE_VERSION =	3.5.8

SHARED_ONLY =		Yes
CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.61

CONFIGURE_ARGS =	${MODKDE_CONFIGURE_ARGS}
CONFIGURE_ENV +=	${MODKDE_CONFIGURE_ENV} \
			CPPFLAGS=-I${LOCALBASE}/include \
			LDFLAGS=-L${LOCALBASE}/lib
MAKE_FLAGS +=		${MODKDE_MAKE_FLAGS}
USE_GMAKE =		Yes

LIB_DEPENDS +=		graphics/lcms \
			x11/kde/libs3
RUN_DEPENDS =		graphics/dcraw

WANTLIB += ICE SM X11 Xau Xdmcp Xext Xrender jpeg m png
WANTLIB += util z art_lgpl_2 idn
WANTLIB += fam rpcsvc stdc++ pthread-stubs xcb lcms
WANTLIB += DCOP kdecore kdefx kdesu kdeui kio kwalletclient

# GPL
PERMIT_DISTFILES_CDROM = Yes
PERMIT_PACKAGE_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes
PERMIT_PACKAGE_FTP = Yes

.include <bsd.port.mk>
