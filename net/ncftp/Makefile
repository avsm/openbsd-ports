# $OpenBSD: Makefile,v 1.9.2.1 2000/09/15 05:09:42 marc Exp $

DISTNAME=       	ncftp-3.0.1-src
PKGNAME=		ncftp-3.0.1
CATEGORIES=		net
NEED_VERSION=		 1.307
MASTER_SITES=		ftp://ftp.ncftp.com/ncftp/

MAINTAINER=		shinobi@monkey.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

LIB_DEPENDS=    	intl::devel/gettext
CONFIGURE_STYLE=	gnu dest
WRKDIST=		${WRKDIR}/${PKGNAME}

.include <bsd.port.mk>
