# $OpenBSD: Makefile,v 1.16.2.1 2001/04/10 17:44:48 naddy Exp $

DISTNAME=		slrn-0.9.7.0a
CATEGORIES=		news
NEED_VERSION=		1.340

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	slrn
HOMEPAGE=		http://www.slrn.org/

MAINTAINER=		David Lebel <lebel@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

LIB_DEPENDS=		slang.::devel/libslang

CONFIGURE_STYLE=	gnu

do-install:
	@cd ${WRKBUILD}/src && make ${FAKE_FLAGS} install

post-install:
	@mv -f ${PREFIX}/doc/slrn ${PREFIX}/share/doc/slrn
	@rmdir ${PREFIX}/doc

.include <bsd.port.mk>
