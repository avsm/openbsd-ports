# $OpenBSD: Makefile,v 1.18.2.2 2003/01/07 00:12:39 brad Exp $

COMMENT= 		"X11 toolkit, graphics applications"
CATEGORIES=		x11 x11/kde
VERSION=		2.2.2
DISTNAME=		kdegraphics-${VERSION}
PKGNAME=		${DISTNAME}p2

LIB_DEPENDS= kdecore.3,DCOP,kdeprint,kdesu,kdeui,kfile,kio,kparts,kssl,ksycoca::x11/kde/libs2

BUILD_DEPENDS=	::x11/qt2-designer

.include <bsd.port.mk>
