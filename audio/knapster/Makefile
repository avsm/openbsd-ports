# $OpenBSD: Makefile,v 1.1.1.1.2.1 2000/09/15 04:42:37 marc Exp $

DISTNAME=		knapster-0.12
CATEGORIES=     	audio
NEED_VERSION=		1.300

HOMEPAGE=		http://knapster.netpedia.net/

MAINTAINER=		jakob@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		http://knapster.netpedia.net/packages/

LIB_DEPENDS=		kdecore.1::x11/kde/libs

USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-qt-includes=${PREFIX}/include/X11/qt \
			--with-qt-libraries=${PREFIX}/lib

.include <bsd.port.mk>
