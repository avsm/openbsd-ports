# $OpenBSD: Makefile,v 1.2.2.1 2006/06/24 07:17:14 sturm Exp $
COMMENT=	"handling CHM files"
CATEGORIES=	devel textproc

HOMEPAGE=	http://66.93.236.84/~jedwin/projects/chmlib/
MASTER_SITES=	${HOMEPAGE}

DISTNAME=	chmlib-0.38
SHARED_LIBS=		chm 0.1

CONFIGURE_STYLE=gnu
USE_LIBTOOL=	Yes
USE_GMAKE=	Yes

# stupid linux shit
CONFIGURE_ARGS=	--disable-io64

WANTLIB=	pthread

#GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

NO_REGRESS=	Yes

.include <bsd.port.mk>
