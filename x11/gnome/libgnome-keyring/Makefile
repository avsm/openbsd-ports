# $OpenBSD: Makefile,v 1.15 2011/09/28 09:47:47 jasper Exp $

COMMENT=	library for gnome keyring integration

GNOME_PROJECT=	libgnome-keyring
GNOME_VERSION=	3.2.0

SHARED_LIBS +=  gnome-keyring        6.0      # 1.1

# GPLv2/LGPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += dbus-1 glib-2.0 gpg-error pcre gcrypt

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	security/libgcrypt \
		x11/dbus \
		devel/glib2

.include <bsd.port.mk>
