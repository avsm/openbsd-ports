# $OpenBSD: Makefile,v 1.23 2011/09/26 09:44:08 ajacoutot Exp $

COMMENT=	collection of shared GSettings schemas

GNOME_PROJECT=	gsettings-desktop-schemas
GNOME_VERSION=	3.2.0

CATEGORIES=	devel

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	x11/gnome \
		devel/dconf

BUILD_DEPENDS=	devel/gettext

# don't inherit USE_LIBTOOL from the gnome MODULE
USE_LIBTOOL=	No

CONFIGURE_STYLE=gnu

FAKE_FLAGS=	pkgconfigdir=${PREFIX}/lib/pkgconfig

.include <bsd.port.mk>
