# $OpenBSD: Makefile,v 1.3.2.1 2002/08/16 23:04:06 brad Exp $

COMMENT= 		"X11 toolkit, network applications"
CATEGORIES=		x11 x11/kde
NEED_VERSION=		1.504
VERSION=		3.0
DISTNAME=		kdenetwork-${VERSION}
PKGNAME=		${DISTNAME}p1
PATCHFILES=		post-3.0.1-kdenetwork.diff
PATCH_DIST_STRIP=	-p1

LIB_DEPENDS= kdecore.4,DCOP,kabc,kdefx,kdeprint,kdesu,kdeui,khtml,kio,kjava,kparts,kspell,vcard::x11/kde/libs3
#BUILD_DEPENDS=	::audio/lame

# for kaddressbook
RUN_DEPENDS+=	::x11/kde/base3

.include <bsd.port.mk>
