# $OpenBSD: Makefile,v 1.2 2011/10/15 08:04:45 sebastia Exp $

COMMENT =	GNUstep webserver framework

VERSION =	1.4.5
DISTNAME =	WebServer-${VERSION}
PKGNAME =	gnustep-webserver-${VERSION}

SHARED_LIBS +=  WebServer	1.0

CATEGORIES =	www

HOMEPAGE =	http://wiki.gnustep.org/index.php/WebServer

MASTER_SITES =	${MASTER_SITE_GNUSTEP:=libs/}

MODULES =		x11/gnustep
MODGNUSTEP_NEEDS_GUI = 	No
WANTLIB +=		Performance
LIB_DEPENDS +=		x11/gnustep/performance

MAKE_FLAGS +=	WebServer_INTERFACE_VERSION=${LIBWebServer_VERSION}

.include <bsd.port.mk>
