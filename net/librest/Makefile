# $OpenBSD: Makefile,v 1.11 2011/09/20 21:04:25 jasper Exp $

COMMENT =	access web services that claim to be RESTful

GNOME_VERSION =	0.7.10
GNOME_PROJECT =	rest
PKGNAME =	lib${DISTNAME}

CATEGORIES =	net devel

SHARED_LIBS +=	rest-0.7  	0.1
SHARED_LIBS +=	rest-extras-0.7 0.0

HOMEPAGE =	http://moblin.org/projects/librest

MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>, \
		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += dbus-1 gcrypt gio-2.0 glib-2.0 gmodule-2.0 gnome-keyring
WANTLIB += gobject-2.0 gpg-error gthread-2.0 m pcre soup-2.4 soup-gnome-2.4
WANTLIB += sqlite3 xml2 z

MODULES =		devel/gettext \
			x11/gnome
MODGNOME_TOOLS= 	goi

LIB_DEPENDS =		devel/libsoup,-gnome

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	--with-gnome

.include <bsd.port.mk>
