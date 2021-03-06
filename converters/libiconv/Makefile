# $OpenBSD: Makefile,v 1.41 2011/09/02 15:44:46 naddy Exp $

COMMENT=	character set conversion library

DISTNAME=	libiconv-1.14
CATEGORIES=	converters devel
MASTER_SITES=	${MASTER_SITE_GNU:=libiconv/}

SHARED_LIBS=	charset		1.1 \
		iconv		6.0

HOMEPAGE=	http://www.gnu.org/software/libiconv/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# LGPLv2 and GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=	c

BUILD_DEPENDS=	devel/gperf

MAKE_FLAGS=	INSTALL_DATA=cp

USE_LIBTOOL=	Yes
SEPARATE_BUILD=	simple
CONFIGURE_STYLE= gnu
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/build-aux ${WRKSRC}/libcharset/build-aux
CONFIGURE_ARGS= ${CONFIGURE_SHARED} \
		--disable-nls \
		--enable-extra-encodings \
		--enable-static
CONFIGURE_ENV=	am_cv_proto_iconv='extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);'

pre-configure:
	@cd ${WRKSRC}; \
		${SETENV} ${CONFIGURE_ENV} ${MAKE} -f Makefile.devel lib/aliases.h

.include <bsd.port.mk>
