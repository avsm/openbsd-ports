# $OpenBSD: Makefile,v 1.17 2011/05/11 12:03:19 jasper Exp $

COMMENT=	simple and performant DNS server

VERSION=	1.3.07.11
DISTNAME=	maradns-${VERSION}
REVISION=	0
CATEGORIES=	net

HOMEPAGE=	http://www.maradns.org/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	c pthread

MASTER_SITES=	http://maradns.org/download/1.3/

MAKE_FLAGS=	CC="${CC}" FLAGS="${CFLAGS} -D_THREAD_SAFE -pthread"

USE_GROFF =	Yes
NO_REGRESS=	Yes

post-configure:
	@find ${WRKSRC} -type f | xargs perl -pi -e "s,/etc,${SYSCONFDIR},g"
	@perl -pi -e "s, = 99, = 537," ${WRKSRC}/doc/en/examples/ex*

post-install:
	@mv ${PREFIX}/share/doc/maradns/examples \
		${PREFIX}/share/examples/maradns

.include <bsd.port.mk>
