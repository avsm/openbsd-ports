# $OpenBSD: Makefile,v 1.49 2011/09/16 11:13:38 espie Exp $

SHARED_ONLY=	Yes

COMMENT=	jabber client written in pygtk
DISTNAME=	gajim-0.14.4
REVISION=		0
CATEGORIES=	net x11

MASTER_SITES=	${HOMEPAGE}/downloads/0.14/

HOMEPAGE=	http://www.gajim.org/

MAINTAINER=	Pierre-Emmanuel Andre <pea@openbsd.org>

# GPLv3 only
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} 

USE_GMAKE=	Yes
USE_LIBTOOL=	Yes
USE_GROFF =	Yes
LIBTOOL_FLAGS=	--tag=disable-static

MODULES=	lang/python \
		textproc/intltool

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	databases/py-sqlite2 \
		devel/desktop-file-utils \
		net/py-dns \
		x11/dbus-python \
		x11/py-gtk2  \
		security/py-openssl \
		security/py-crypto \
		net/avahi,-gui,no_mono,no_qt3,no_qt4 \
		textproc/gtkspell \
		net/farsight2 \
		devel/py-notify

.include <bsd.port.mk>
