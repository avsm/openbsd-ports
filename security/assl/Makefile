# $OpenBSD: Makefile,v 1.16 2011/09/26 17:11:28 todd Exp $

COMMENT=		hide awful SSL API in a sane interface

DISTNAME=		assl-0.10.2
EPOCH=			0
CATEGORIES=		security devel
SHARED_LIBS=		assl 3.2

HOMEPAGE=		http://opensource.conformal.com/wiki/Assl
MASTER_SITES=		http://opensource.conformal.com/snapshots/assl/

MAINTAINER=		David Hill <dhill@openbsd.org>

# ISC
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

NO_REGRESS=		Yes
EG_DIR=			${PREFIX}/share/examples/assl

.if ${MACHINE_ARCH:Mmips64*}
EXTRA_CFLAGS=   -D__BUILTIN_HACK
# See bsd.lib.mk:162
PKG_ARGS+=	-Dno_mips64=0
.else
PKG_ARGS+=	-Dno_mips64=1
.endif

do-configure:
	printf "major=${LIBassl_VERSION:R}\nminor=${LIBassl_VERSION:E}\n" \
	    > ${WRKSRC}/shlib_version

post-install:
	${INSTALL_DATA_DIR} ${EG_DIR}
	cd ${WRKSRC}/examples && \
		find . -type d \
			-exec ${INSTALL_DATA_DIR} ${EG_DIR}/{} \; && \
		find . ! -type d \
			-exec ${INSTALL_DATA} -m 644 {} ${EG_DIR}/{} \;

.include <bsd.port.mk>
