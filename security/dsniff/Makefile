# $OpenBSD: Makefile,v 1.9.2.1 2000/09/15 05:15:10 marc Exp $

DISTNAME=	dsniff-2.2
CATEGORIES=	security
NEED_VERSION=	1.310
MASTER_SITES=	http://www.monkey.org/~dugsong/dsniff/

HOMEPAGE=	http://www.monkey.org/~dugsong/dsniff/

BUILD_DEPENDS=	${LOCALBASE}/lib/libnet.a::net/libnet \
		${LOCALBASE}/lib/libnids.a::net/libnids

MAINTAINER=	dugsong@monkey.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

CONFIGURE_STYLE= gnu

FAKE_FLAGS=	install_prefix="${WRKINST}"

.include <bsd.port.mk>
