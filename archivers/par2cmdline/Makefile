# $OpenBSD: Makefile,v 1.8 2010/07/25 02:59:44 jolan Exp $

COMMENT=	command line implementation of the PAR v2.0 specification
DISTNAME=	par2cmdline-0.4
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=parchive/}

HOMEPAGE=	http://parchive.sourceforge.net/\#client_par2cmdline

# GPL
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

REVISION =	1
WANTLIB=		c m stdc++

CONFIGURE_STYLE=gnu

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/par2cmdline
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/par2cmdline

.include <bsd.port.mk>
