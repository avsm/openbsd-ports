# $OpenBSD: Makefile,v 1.11 2010/11/19 07:23:13 espie Exp $

COMMENT=	print information about the content and structure of a DVD

DISTNAME=	lsdvd-0.16
REVISION=	0
CATEGORIES=	multimedia

HOMEPAGE=	http://untrepid.com/lsdvd/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c dvdread

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=lsdvd/}

LIB_DEPENDS=	devel/libdvdread

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_GROFF =	Yes

.include <bsd.port.mk>
