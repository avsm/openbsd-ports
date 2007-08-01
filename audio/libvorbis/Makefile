# $OpenBSD: Makefile,v 1.23.2.1 2007/08/01 06:13:57 ajacoutot Exp $

COMMENT=	"audio compression codec library"

DISTNAME=	libvorbis-1.1.2
PKGNAME=	${DISTNAME}p1
CATEGORIES=    	audio
HOMEPAGE=	http://www.xiph.org/vorbis/
SHARED_LIBS=	vorbis		5.1 \
		vorbisenc	2.2 \
		vorbisfile	4.1

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

# no inter-library dependency, but we still build against the API
LIB_DEPENDS=	ogg.>=5::audio/libogg

USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} --with-ogg=${LOCALBASE}
SEPARATE_BUILD=	simple

.include <bsd.port.mk>
