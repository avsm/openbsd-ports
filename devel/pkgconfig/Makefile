# $OpenBSD: Makefile,v 1.32 2011/09/16 09:24:54 espie Exp $

COMMENT=		tool for managing library compile/link flags

# note if updating; metaauto is also built from the pkg-config distfile.
IGNORE=			Replaced with BSD clone in OpenBSD 4.1
VERSION=		0.26
DISTNAME=		pkg-config-${VERSION}
PKGNAME=		pkgconfig-${VERSION}
REVISION=		0
CATEGORIES=		devel

HOMEPAGE=		http://www.freedesktop.org/software/pkgconfig/
MASTER_SITES=		http://pkgconfig.freedesktop.org/releases/

CONFIGURE_ARGS+=	--with-pc_path=${LOCALBASE}/lib/pkgconfig:${X11BASE}/lib/pkgconfig

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c pcre glib-2.0 pthread
USE_LIBTOOL=		Yes
USE_GROFF =		Yes

MODULES=		devel/gettext

LIB_DEPENDS=		devel/glib2

CONFIGURE_STYLE=	gnu
# This pkg-config has just become a reference application. So it's safe to
# depend on glib2 (which does depend on pkg-config. But that's the version
# from base.)
CONFIGURE_ARGS+=	--with-installed-glib

.include <bsd.port.mk>
