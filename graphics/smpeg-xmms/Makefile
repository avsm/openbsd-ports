# $OpenBSD: Makefile,v 1.19 2011/09/16 10:02:38 espie Exp $

COMMENT=	MPEG and VCD video playback in XMMS
SHARED_ONLY=	Yes

VERSION=	0.3.5
DISTNAME=	smpeg-xmms-${VERSION}
PKGNAME=	xmms-smpeg-${VERSION}
REVISION =	5
CATEGORIES=	graphics

MAINTAINER=	Wilbern Cobb <wcobb@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	SDL X11 Xau Xdmcp Xext Xrandr Xrender m sndio \
		pthread-stubs xcb usbhid xmms>=2 smpeg>=1.3

MASTER_SITES=	ftp://ftp.sunet.se/pub/multimedia/xmms/plugins/smpeg-xmms/

MODULES=	converters/libiconv

LIB_DEPENDS=	audio/xmms \
		devel/smpeg

USE_LIBTOOL=	Yes
LIBTOOL_FLAGS=	--tag=disable-static

SEPARATE_BUILD=	concurrent
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--with-glib-prefix=${LOCALBASE} \
		--with-gtk-prefix=${LOCALBASE} \
		--with-sdl-prefix=${LOCALBASE} \
		--with-xmms-prefix=${LOCALBASE}

.include <bsd.port.mk>
