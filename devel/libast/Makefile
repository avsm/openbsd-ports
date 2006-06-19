# $OpenBSD: Makefile,v 1.2.2.1 2006/06/19 06:09:49 sturm Exp $

COMMENT=		"library of assorted spiffy things"

DISTNAME=		libast-0.7
CATEGORIES=		devel

HOMEPAGE=		http://eterm.sourceforge.net/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		ICE m SM freetype X11 Xext


MASTER_SITES=		http://www.eterm.org/download/

LIB_DEPENDS=		Imlib2.2::graphics/imlib2

USE_X11=		Yes
CONFIGURE_STYLE=	gnu

.include <bsd.port.mk>
