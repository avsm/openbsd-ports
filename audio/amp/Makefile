# $OpenBSD: Makefile,v 1.8.2.1 2000/09/15 04:42:26 marc Exp $

BROKEN=		unsupported and not working properly

DISTNAME=	amp-0.7.6
CATEGORIES=	audio
NEED_VERSION=	1.300
MASTER_SITES=	ftp://ftp.clara.net/pub/unix/Audio/

MAINTAINER=	angelos@openbsd.org

PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu

MAKE_FLAGS=	CFLAGS="${CFLAGS}"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/amp ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/amp.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
