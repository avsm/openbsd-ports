# $OpenBSD: Makefile,v 1.20 2011/06/26 10:29:11 sthen Exp $

COMMENT=	monitoring and managing daemons utility

DISTNAME=	monit-4.10.1
REVISION=	2

CATEGORIES=	sysutils

HOMEPAGE=	http://www.tildeslash.com/monit/

MAINTAINER=	Ben Lovett <ben@tilderoot.com>

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += c crypto kvm pthread ssl

MASTER_SITES=	${HOMEPAGE}dist/ \
		${HOMEPAGE}dist/old/

CONFIGURE_STYLE=gnu

USE_GMAKE=	Yes
USE_GROFF=	Yes

NO_REGRESS=	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/monit
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/monit
	cd ${WRKSRC} && ${INSTALL_DATA} FAQ.txt README.SSL UPGRADE.txt \
		${PREFIX}/share/doc/monit
	cd ${WRKSRC}/doc && ${INSTALL_DATA} monit.html examples.html \
		${PREFIX}/share/doc/monit
	cd ${WRKSRC}/protocols && ${INSTALL_DATA} NOTES \
		${PREFIX}/share/doc/monit
	cd ${WRKSRC} && ${INSTALL_DATA} monitrc \
		${PREFIX}/share/examples/monit
	${INSTALL_DATA} ${WRKSRC}/contrib/monit.php \
		${PREFIX}/share/examples/monit \

.include <bsd.port.mk>
