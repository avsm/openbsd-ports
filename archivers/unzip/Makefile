# $OpenBSD: Makefile,v 1.17.2.1 2000/09/15 04:40:53 marc Exp $

DISTNAME=	unzip541
PKGNAME=	unzip-5.41
CATEGORIES=	archivers
NEED_VERSION=	1.310
MASTER_SITES=	ftp://ftp.freesoftware.com/pub/infozip/src/

HOMEPAGE=	http://ftp.freesoftware.com/pub/infozip/

MAINTAINER=	ports@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MAKE_FLAGS=	CC="${CC}" LD="${CC}" LOC="${CFLAGS} -DUSE_UNSHRINK" \
		CF='-I. $$(LOC)'
FAKE_FLAGS=	prefix="${WRKINST}${PREFIX}"

MAKE_FILE=	unix/Makefile

ALL_TARGET=	bsd

WRKDIST=	${WRKDIR}/${PKGNAME}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/unzip
	cd ${WRKSRC}; ${INSTALL_DATA} README COPYING WHERE ${PREFIX}/share/doc/unzip

.include <bsd.port.mk>
