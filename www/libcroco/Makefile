# $OpenBSD: Makefile,v 1.13 2011/09/28 09:51:36 jasper Exp $

COMMENT=		generic CSS parsing library for GNOME project

GNOME_PROJECT=		libcroco
GNOME_VERSION=		0.6.2
REVISION=		2
SHARED_LIBS +=	croco-0.6            4.0      # .3.1
CATEGORIES=		www devel

HOMEPAGE=		http://www.freespiders.org/projects/libcroco/

# LGPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB=		c glib-2.0 m pcre pthread xml2 z

MODULES=		devel/gettext \
			x11/gnome

LIB_DEPENDS=		devel/glib2 \
			textproc/libxml

CONFIGURE_STYLE= 	gnu

.include <bsd.port.mk>
