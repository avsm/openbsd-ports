# $OpenBSD: Makefile,v 1.7.2.1 2000/09/15 05:18:08 marc Exp $

DISTNAME=	idled-1.16
CATEGORIES=	sysutils
MASTER_SITES=	http://www.darkwing.com/idled/download/ \
		ftp://ftp.cs.hope.edu/pub/idled/

MAINTAINER=	ports@openbsd.org

PERMIT_PACKAGE_CDROM=	"no fee"
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	"no fee"
PERMIT_DISTFILES_FTP=	Yes

post-extract:
	@cd ${WRKSRC}; make clean

FAKE_FLAGS=PREFIX=${PREFIX} DESTDIR=${WRKINST}
.include <bsd.port.mk>
