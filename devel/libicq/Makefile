# $OpenBSD: Makefile,v 1.8.2.1 2000/09/15 04:49:13 marc Exp $
# $FreeBSD: Makefile,v 1.3 1999/03/15 19:59:22 nectar Exp $

DISTNAME=	libicq-0.33
CATEGORIES=	devel
NEED_VERSION=	 1.230
FAKE=		Yes
MASTER_SITES=	ftp://ftp.korsoft.com/pub/gicq/

MAINTAINER=	brad@openbsd.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

LIB_DEPENDS=	glib.1.2::devel/glib

SEPARATE_BUILD= concurrent
GNU_CONFIGURE=	Yes
CONFIGURE_ARGS+= ${CONFIGURE_SHARED}
CONFIGURE_ARGS+= --enable-static
CONFIGURE_ENV=	GLIB_CONFIG="${LOCALBASE}/bin/glib-config"

.include <bsd.port.mk>


