# $OpenBSD: Makefile,v 1.10.2.1 2002/12/26 22:28:17 pvalchev Exp $

COMMENT= 		"X11 toolkit, additional artwork"
CATEGORIES=		x11 x11/kde
VERSION=		3.0.5a
DISTNAME=		kdeartwork-${VERSION}

LIB_DEPENDS=kdecore.4,DCOP,kdefx,kdesu,kdeui,kio,kscreensaver::x11/kde/libs3 \
    kwin::x11/kde/base3
SEPARATE_BUILD=simple

pre-fake:
	${INSTALL_DATA_DIR} ${PREFIX}/share/apps/kthememgr/Themes

.include <bsd.port.mk>
