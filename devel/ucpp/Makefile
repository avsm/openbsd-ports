# $OpenBSD: Makefile,v 1.7 2010/11/15 19:46:09 espie Exp $

DISTNAME =	ucpp-1.2
COMMENT =	C preprocessor and lexer
CATEGORIES =	devel
HOMEPAGE =	http://pornin.nerim.net/ucpp/
MASTER_SITES =	${HOMEPAGE}

PERMIT_PACKAGE_FTP =	Yes
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
WANTLIB =		c

MAINTAINER =	Marc Espie <espie@openbsd.org>
MAKE_FLAGS =	FLAGS='${CFLAGS} -D_POSIX_SOURCE' CC='${CC}'
USE_GROFF =	Yes
NO_REGRESS =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/ucpp ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/ucpp.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
