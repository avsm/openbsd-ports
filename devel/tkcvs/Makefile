# $OpenBSD: Makefile,v 1.12.2.1 2000/09/15 04:49:30 marc Exp $

DISTNAME=	tkcvs-6.0
CATEGORIES=	devel
NEED_VERSION=	1.230

MAINTAINER=	todd@OpenBSD.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://www.neosoft.com/tcl/ftparchive/sorted/packages-7.6/apps/tkcvs-6.0/

RUN_DEPENDS=	/usr/local/bin/wish8.3::x11/tk/8.3 

NO_BUILD=	Yes

do-install:
	cd $(WRKSRC)/tkcvs; ./doinstall

.include <bsd.port.mk>
