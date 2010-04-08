# $OpenBSD: Makefile,v 1.2.2.1 2010/04/08 03:16:48 william Exp $

SHARED_ONLY=	Yes

COMMENT=	advanced IRC bouncer

DISTNAME=	znc-0.070
PKGNAME=	${DISTNAME}p0
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=znc/}

HOMEPAGE=	http://znc.in/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=	c crypto m perl ssl stdc++ util

SEPARATE_BUILD=	concurrent
USE_GMAKE=	Yes
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= --disable-optimization

post-install:
	@chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/znc

.include <bsd.port.mk>
