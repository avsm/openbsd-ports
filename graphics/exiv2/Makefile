# $OpenBSD: Makefile,v 1.12 2010/10/18 18:13:13 espie Exp $

HOMEPAGE=	http://www.exiv2.org/
COMMENT=	manipulate image meta-data such as exif and ipct
CATEGORIES=	graphics devel
MASTER_SITES=	${HOMEPAGE}
DISTNAME=	exiv2-0.20

SHARED_LIBS +=	exiv2                4.0      # .9.0
WANTLIB += 	c m stdc++ z expat pthread

USE_LIBTOOL=	Yes
USE_GMAKE=	Yes
USE_GROFF =	Yes
CONFIGURE_STYLE=gnu

MODULES=	devel/gettext

CONFIGURE_ARGS=	${CONFIGURE_SHARED} --enable-static
CONFIGURE_ENV=	LDFLAGS="${LDFLAGS} -pthread"

# GPLv2+
PERMIT_DISTFILES_CDROM=Yes
PERMIT_PACKAGE_CDROM=Yes
PERMIT_DISTFILES_FTP=Yes
PERMIT_PACKAGE_FTP=Yes

NO_REGRESS=	Yes

.include <bsd.port.mk>
