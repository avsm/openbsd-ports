# $OpenBSD: Makefile,v 1.18.2.1 2000/09/15 04:46:06 marc Exp $

DISTNAME=	iozone3_24
PKGNAME=	iozone-3.24
CATEGORIES=	benchmarks
NEED_VERSION=	1.234
MASTER_SITES=	http://www.iozone.org/src/current/
EXTRACT_SUFX=	.tar

MAINTAINER=	brad@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

FAKE=	Yes

MAKE_FILE=	makefile
ALL_TARGET=	openbsd

WRKDIST=	${WRKDIR}/src/current

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/iozone ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/iozone.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
