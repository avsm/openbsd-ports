# $OpenBSD: Makefile,v 1.23 2011/10/10 13:31:43 mpi Exp $

COMMENT=	powerful IMAP/Maildir synchronization and reader support

MODPY_EGG_VERSION= 6.3.4
DISTNAME=	offlineimap_${MODPY_EGG_VERSION}.orig
CATEGORIES=	mail
PKGNAME=	offlineimap-${MODPY_EGG_VERSION}

HOMEPAGE=	http://offlineimap.org/

MAINTAINER=	Pierre-Emmanuel Andre <pea@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://github.com/nicolas33/offlineimap/tarball/v${MODPY_EGG_VERSION}/

NO_REGRESS=	Yes

MODULES=	lang/python

BUILD_DEPENDS=	textproc/py-docutils

WRKDIST=	${WRKDIR}/nicolas33-offlineimap-94450e9

EXAMPLESDIR=	${PREFIX}/share/examples/offlineimap

post-build:
	@cd ${WRKSRC}/docs && ${LOCALBASE}/bin/rst2man MANUAL.rst ${WRKBUILD}/offlineimap.1

post-install:
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/offlineimap.conf{,.minimal} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/offlineimap.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
