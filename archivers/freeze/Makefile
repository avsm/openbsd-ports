# $OpenBSD: Makefile,v 1.9.2.1 2000/09/15 04:40:32 marc Exp $

DISTNAME=       freeze-2.5
CATEGORIES=	archivers
NEED_VERSION=	1.301
MASTER_SITES=	ftp://ftp.freesoftware.com/pub/unixfreeware/archive/ \
		ftp://ftp.warwick.ac.uk/pub/compression/

MAINTAINER=     ports@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

CONFIGURE_STYLE= gnu dest

MAKE_FLAGS=	CFLAGS="${CFLAGS} -I."

.include <bsd.port.mk>
