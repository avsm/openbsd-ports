# $OpenBSD: Makefile,v 1.22 2010/11/11 12:35:18 sthen Exp $

COMMENT=	tiny/turbo/throttling HTTP server

DISTNAME=	thttpd-2.25b
REVISION=	2
CATEGORIES=    	www

HOMEPAGE=	http://www.acme.com/software/thttpd/

MAINTAINER=	Jakob Schlyter <jakob@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes 
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c

MASTER_SITES=		http://www.acme.com/software/thttpd/

CONFIGURE_STYLE=	gnu
USE_GROFF =	Yes

NO_REGRESS=	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/thttpd ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/thttpd.8 ${PREFIX}/man/man8
	${INSTALL_PROGRAM_DIR} ${PREFIX}/libexec/thttpd
	${INSTALL_PROGRAM} ${WRKSRC}/cgi-src/ssi      ${PREFIX}/libexec/thttpd
	${INSTALL_PROGRAM} ${WRKSRC}/cgi-src/redirect ${PREFIX}/libexec/thttpd
	${INSTALL_MAN} ${WRKSRC}/cgi-src/ssi.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/cgi-src/redirect.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
