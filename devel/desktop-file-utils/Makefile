# $OpenBSD: Makefile,v 1.29 2011/09/16 09:24:49 espie Exp $

COMMENT=	utilities for dot.desktop entries

DISTNAME=	desktop-file-utils-0.18
EXTRACT_SUFX=	.tar.bz2
REVISION=	1

CATEGORIES=	devel

HOMEPAGE=	http://freedesktop.org/wiki/Software/desktop-file-utils

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	c glib-2.0 pcre pthread

MASTER_SITES=	http://freedesktop.org/software/desktop-file-utils/releases/

MODULES=	devel/gettext

LIB_DEPENDS=	devel/glib2

USE_LIBTOOL=	Yes
USE_GMAKE=	Yes
USE_GROFF =	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		ac_cv_prog_EMACS=no
CONFIGURE_ARGS=	${CONFIGURE_SHARED}

.include <bsd.port.mk>
