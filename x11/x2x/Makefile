# $OpenBSD: Makefile,v 1.17 2010/10/24 21:15:35 ajacoutot Exp $

COMMENT=		one keyboard/mouse to multiple X displays
DISTNAME=		x2x-1.27
REVISION=		1
CATEGORIES=     	x11

MAINTAINER=		Todd T. Fries <todd@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		X11 Xau Xdmcp Xext Xtst c

MASTER_SITES=	ftp://gatekeeper.dec.com/pub/DEC/SRC/x2x/ \
		ftp://ftp.digital.de/Digital/SRC/x2x/ \
		ftp://ftp.europe.digital.com/pub/DEC/SRC/x2x/

USE_GROFF =	Yes
CONFIGURE_STYLE=	imake

pre-build:
	@nroff -man ${WRKSRC}/x2x.1 > ${WRKSRC}/x2x.man 2> /dev/null

NO_REGRESS=	Yes

.include <bsd.port.mk>
