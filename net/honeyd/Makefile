# $OpenBSD: Makefile,v 1.2.2.1 2004/06/22 06:45:59 robert Exp $

COMMENT=	"utility to create virtual hosts on a network"
DISTNAME=	honeyd-0.8a
CATEGORIES=	net
MASTER_SITES=	${HOMEPAGE}

HOMEPAGE=	http://www.citi.umich.edu/u/provos/honeyd/

MAINTAINER=	Jolan Luff <jolan@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_LIBTOOL=	Yes

BUILD_DEPENDS=	${LOCALBASE}/lib/libdnet.a::net/libdnet

CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
