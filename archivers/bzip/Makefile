# $OpenBSD: Makefile,v 1.14.2.1 2000/09/15 04:40:28 marc Exp $

DISTNAME=	bzip-0.21
CATEGORIES=	archivers
NEED_VERSION=	1.301
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	ports@openbsd.org

PERMIT_PACKAGE_CDROM=	No
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	No
PERMIT_DISTFILES_FTP=	Yes

MAKE_FLAGS=	CC="${CC}" \
		CFLAGS="${CFLAGS} -fomit-frame-pointer -funroll-loops \
		-Wall -Winline -Wshadow -W"

pre-install:
	@cat ${FILESDIR}/COPYRIGHT

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bzip ${PREFIX}/bin
	@cd ${PREFIX}/bin; ln -fs bzip bunzip
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${PREFIX}/man/man1/bunzip.1

.include <bsd.port.mk>
