# $OpenBSD: Makefile,v 1.2.2.1 2000/09/15 05:21:30 marc Exp $
# Original from: Bruno Rohee <rohee@OpenBSD.ORG>
#
# Many variables moved to ../Makefile.inc
#
DISTNAME=		English
PKGNAME=		amaya-english-dict
NEED_VERSION=		1.223

RUN_DEPENDS=		${PREFIX}/bin/amaya:www/amaya/browser

NO_BUILD=		Yes

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/Amaya/dicopar
	${INSTALL_DATA} ${WRKDIR}/Eprinc.dic ${PREFIX}/Amaya/dicopar

.include <bsd.port.mk>
