# $OpenBSD: Makefile,v 1.15 2011/09/21 17:20:56 jasper Exp $

COMMENT=	network traffic visualization and editing tool

DISTNAME=	netdude-0.4.8a
REVISION=	2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=netdude/}

HOMEPAGE=	http://netdude.sourceforge.net/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	devel/gettext

LIB_DEPENDS=	net/libnetdude/libnetdude \
		net/libpcapnav \
		devel/glib \
		x11/gtk+

WANTLIB=	X11 Xau Xdmcp Xext Xi c m pcap pthread-stubs xcb netdude \
		pcapnav glib>=1 gmodule>=1 gdk gtk

USE_LIBTOOL=		Yes
USE_GROFF =		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-html-dir=${PREFIX}/share/doc/netdude \
			--disable-gtk-doc --datadir=${PREFIX}/lib
.include <bsd.port.mk>
