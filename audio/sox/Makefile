# $OpenBSD: Makefile,v 1.13.2.1 2000/09/15 04:42:57 marc Exp $

DISTNAME=	sox-12.15
CATEGORIES=	audio
NEED_VERSION=	1.210
MASTER_SITES=	http://home.sprynet.com/~cbagwell/

MAINTAINER=	angelos@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MAKE_FILE=	Makefile.unx
MAKE_ENV=	MISC_DEFINES='-Dunix ${CFLAGS}'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sox ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/sox.1 ${PREFIX}/man/man1/sox.1

.include <bsd.port.mk>
