# $OpenBSD: Makefile,v 1.12 2011/09/07 13:22:10 nigel Exp $

COMMENT=	socat is a relay for bidirectional data transfer 

DISTNAME=	socat-1.7.1.3
REVISION =	0
CATEGORIES=	net

HOMEPAGE=	http://www.dest-unreach.org/socat/

MAINTAINER=	Nigel Taylor <nigel@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${HOMEPAGE}/download/

WANTLIB=	curses c readline crypto util ssl wrap

USE_GROFF =	Yes
NO_REGRESS=	Yes

CONFIGURE_STYLE=gnu

pre-build:
	${SUBST_CMD} ${WRKSRC}/doc/socat.1

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/socat
.for file in FAQ README SECURITY doc/xio.help doc/*.html doc/dest-unreach.css
	${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/share/doc/socat
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/socat
.for file in EXAMPLES testcert.conf *.sh
	${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/share/examples/socat
.endfor


.include <bsd.port.mk>
