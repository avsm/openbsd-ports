# $OpenBSD: Makefile,v 1.13.2.1 2000/09/15 04:40:48 marc Exp $
# $FreeBSD: Makefile,v 1.1.1.1 1999/04/02 04:19:20 steve Exp $

DISTNAME=	unacepub
PKGNAME=	unace-1.2b
CATEGORIES=	archivers
NEED_VERSION=	1.301
MASTER_SITES=	http://members.aol.com/mlemke6413/

MAINTAINER=	brad@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_ZIP=	Yes

MAKE_FILE=	unix/makefile
MAKE_FLAGS=	CC="${CC}" CFLAGS="${CFLAGS} -Wall -DUNIX -DCASEINSENSE"

ALL_TARGET=	unace

WRKDIST=	${WRKDIR}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unace ${PREFIX}/bin

.include <bsd.port.mk>
