# $OpenBSD: Makefile,v 1.7.2.1 2003/01/07 00:12:40 brad Exp $

COMMENT= 		"X11 toolkit, network applications"
CATEGORIES=		x11 x11/kde
VERSION=		2.2.2
DISTNAME=		kdenetwork-${VERSION}
PKGNAME=		${DISTNAME}p1

LIB_DEPENDS=	kdecore.3,kdeui::x11/kde/libs2

BUILD_DEPENDS=	::x11/qt2-designer 

# for kaddressbook
RUN_DEPENDS+=	::x11/kde/base2

.include <bsd.port.mk>
