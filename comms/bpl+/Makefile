# $OpenBSD: Makefile,v 1.8.2.1 2000/11/20 13:36:21 espie Exp $

DISTNAME=	bpl+
PKGNAME=	bpl+-1.0
CATEGORIES=	comms

MAINTAINER=	ports@openbsd.org

PERMIT_PACKAGE_CDROM=	"no license"
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	"no license"
PERMIT_DISTFILES_FTP=	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bpl ${PREFIX}/bin
	@ln -fs bpl ${PREFIX}/bin/bp

.include <bsd.port.mk>
