# $OpenBSD: Makefile,v 1.17.2.1 2003/05/02 18:49:29 naddy Exp $

COMMENT=		"X11 toolkit, graphic applications"
CATEGORIES=		x11 x11/kde
VERSION=		3.1
DISTNAME=		kdegraphics-${VERSION}
PKGNAME=		${DISTNAME}p0

LIB_DEPENDS=Imlib::graphics/imlib \
	ungif::graphics/libungif \
	kdecore.4,DCOP,kdefx,kdeprint,kdesu,kdeui,kio,kparts::x11/kde/libs3 \
	glut::graphics/glut

RUN_DEPENDS= :ghostscript-*:print/ghostscript/gnu

SEPARATE_BUILD=flavored

.include <bsd.port.mk>
