# $OpenBSD: Makefile,v 1.15 2010/10/18 18:36:59 espie Exp $

COMMENT=	lightweight userspace bandwidth shaper
DISTNAME=	trickle-1.06
REVISION=	4
CATEGORIES=	net
HOMEPAGE=	"http://monkey.org/~marius/pages/?page=trickle"
MASTER_SITES=	http://monkey.org/~marius/trickle/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c event

USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu
USE_GROFF =	Yes

.include <bsd.port.mk>
