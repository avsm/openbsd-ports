# $OpenBSD: Makefile,v 1.11 2011/09/06 20:36:24 jasper Exp $

COMMENT=		debugger for use with MSP 430 MCUs

DISTNAME=		mspdebug-0.17
REVISION=		1
CATEGORIES=		devel devel/msp430

HOMEPAGE=		http://mspdebug.sourceforge.net/

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=mspdebug/}

WANTLIB += c readline termcap usb

BUILD_DEPENDS=		archivers/gtar
LIB_DEPENDS=		devel/libusb

TAR=			${LOCALBASE}/bin/gtar

USE_GMAKE=		Yes
MAKE_FLAGS=		CC="${CC}" GCC_CFLAGS="" LDFLAGS=""

NO_REGRESS=		Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mspdebug ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/mspdebug.man ${PREFIX}/man/man1/mspdebug.1

.include <bsd.port.mk>
