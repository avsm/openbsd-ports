# $OpenBSD: Makefile,v 1.30 2010/10/18 17:47:54 espie Exp $

COMMENT=	general-purpose multi-platform x86 assembler

ONLY_FOR_ARCHS=	i386 amd64

VERSION=	2.08.01
DISTNAME=	nasm-${VERSION}
CATEGORIES=	devel lang

HOMEPAGE=	http://www.nasm.us/
MASTER_SITES=	${HOMEPAGE}/pub/nasm/releasebuilds/${VERSION}/

MAINTAINER=	Gallon Sylvestre <ccna.syl@gmail.com>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c

CONFIGURE_STYLE= gnu dest

USE_GROFF =	Yes
ALL_TARGET=	everything
INSTALL_TARGET=	install_everything

NO_REGRESS=	Yes

.include <bsd.port.mk>
