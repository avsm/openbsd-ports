# $OpenBSD: Makefile,v 1.5 2011/10/12 08:37:39 jasper Exp $

COMMENT=	lua binding of zlib
SHARED_ONLY=	Yes
DISTNAME=	luazlib-20100731
REVISION=	0
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_BACKUP}	

HOMEPAGE=	http://github.com/brimworks/lua-zlib/

# MIT
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

MODULES=	lang/lua
REGRESS_DEPENDS += archivers/luazlib
WANTLIB+=	lua m z

CFLAGS+=	-I${LOCALBASE}/include
LINK=		${CC} ${CFLAGS} -fPIC -shared -L${LOCALBASE}/lib -o

do-build:
	cd ${WRKDIST} && ${LINK} zlib.so lua_zlib.c -lz -llua -lm

do-install:
	${INSTALL_DATA_DIR} ${MODLUA_LIBDIR}
	${INSTALL_DATA} ${WRKSRC}/zlib.so ${MODLUA_LIBDIR}

do-regress:
	cd ${WRKDIST} && lua test.lua

.include <bsd.port.mk>
