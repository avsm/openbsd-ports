# $OpenBSD: pear.port.mk,v 1.2 2003/04/03 11:10:40 avsm Exp $
# PHP PEAR module

RUN_DEPENDS+=    pear:php4-pear-4.3.*:www/php4/pear
BUILD_DEPENDS+=  ${RUN_DEPENDS}

NO_BUILD=       Yes
NO_REGRESS=     Yes
NO_CONFIGURE=	Yes

MAKE_FILE=	${PORTSDIR}/www/php4/pear/files/Makefile.pear
FAKE_FLAGS+=	WRKINST=${WRKINST} WRKDIR=${WRKDIR}
