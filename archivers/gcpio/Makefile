# $OpenBSD: Makefile,v 1.6.6.1 2005/02/12 12:09:57 robert Exp $

COMMENT=		"GNU copy-in/out (cpio)"

DISTNAME=		cpio-2.5
PKGNAME=		g${DISTNAME}p0
CATEGORIES=		archivers

MAINTAINER=		David Lebel <lebel@openbsd.org>

# GPL/LGPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${MASTER_SITE_GNU:=cpio/}

CONFIGURE_STYLE=	gnu dest
CONFIGURE_ARGS=		--program-prefix="g"

.include <bsd.port.mk>
