# $OpenBSD: Makefile,v 1.6.2.1 2000/09/15 04:49:04 marc Exp $

DISTNAME=	gsl-0.3b
CATEGORIES=	devel
NEED_VERSION=	1.78
FAKE=		Yes
MASTER_SITES=	ftp://alpha.gnu.org/pub/gnu/


MAINTAINER=	rohee@openbsd.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

HAS_CONFIGURE=	Yes
CONFIGURE_ARGS=	--prefix='$${DESTDIR}${PREFIX}' --sysconfdir='$${DESTDIR}/etc'

.include <bsd.port.mk>
