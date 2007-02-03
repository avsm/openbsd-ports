# $OpenBSD: Makefile,v 1.2.2.2 2007/02/03 17:00:44 sturm Exp $
COMMENT=	"handling CHM files"
CATEGORIES=	devel textproc

HOMEPAGE=	http://www.jedrea.com/chmlib/
MASTER_SITES=	${HOMEPAGE}

DISTNAME=	chmlib-0.39
SHARED_LIBS=		chm 0.2

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
