# $OpenBSD: Makefile,v 1.18 2011/09/16 11:13:40 espie Exp $

COMMENT=	SIP Express Router

ONLY_FOR_ARCHS= i386 sparc

VERSION=	0.8.10
DISTNAME=	ser-${VERSION}_src
PKGNAME=	ser-${VERSION}
REVISION=	2
CATEGORIES=	net
WANTLIB=	c expat z lib/mysql/mysqlclient>=10

MASTER_SITES=	${MASTER_SITE_BERLIOS:=ser/}

HOMEPAGE=	http://www.iptel.org/ser/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WRKDIST=	${WRKDIR}/ser-${VERSION}

USE_GMAKE=	Yes
USE_GROFF =	Yes

ALL_TARGET=	all ser.cfg

LIB_DEPENDS=	databases/mysql

do-install:
	cd ${WRKDIST}; ${MAKE_PROGRAM} PREFIX=${WRKINST}${TRUEPREFIX} install

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/ser
	${INSTALL_DATA} ${WRKDIST}/ser.cfg ${PREFIX}/share/examples/ser

.include <bsd.port.mk>
