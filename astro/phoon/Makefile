# $OpenBSD: Makefile,v 1.6 2010/10/18 16:47:00 espie Exp $

COMMENT=		displays the phase of the moon in ascii

DISTNAME=		phoon_29jun2005
PKGNAME=		phoon-20050629
CATEGORIES=		astro

HOMEPAGE=		http://www.acme.com/software/phoon/

MAINTAINER=		Nick Nauwelaerts <nick@nauwelaerts.net>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c m

MASTER_SITES=		${HOMEPAGE}

MAKE_FLAGS=		CC="${CC}" CFLAGS="${CFLAGS} -DOS_BSD" LDFLAGS=""

WRKDIST=		${WRKDIR}/phoon
NO_REGRESS=		Yes
USE_GROFF =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/phoon ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/phoon.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
