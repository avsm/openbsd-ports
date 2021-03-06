# $OpenBSD: Makefile,v 1.36 2010/11/19 22:31:35 espie Exp $

COMMENT=	easy-to-use, robust, and highly configurable VPN

VERSION=	2.1.4
DISTNAME=	openvpn-${VERSION}
CATEGORIES=	net security

HOMEPAGE=	http://openvpn.net/

MAINTAINER=	Felix Kronlage <fkr@openbsd.org>	

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c crypto ssl pthread lzo2

MASTER_SITES=	http://swupdate.openvpn.net/community/releases/

LIB_DEPENDS=	archivers/lzo2

SEPARATE_BUILD=	concurrent

FAKE=		lib
CONFIGURE_STYLE=gnu

CONFIGURE_ARGS+=--enable-pthread \
		--with-lzo-headers=${DEPBASE}/include \
		--with-lzo-lib=${DEPBASE}/lib \
		--enable-password-save
USE_GROFF =	Yes

SAMPLES_DIR=	${PREFIX}/share/examples/openvpn

post-install:
	${INSTALL_DATA_DIR} ${SAMPLES_DIR}
	${INSTALL_DATA_DIR} ${SAMPLES_DIR}/sample-config-files
	${INSTALL_DATA_DIR} ${SAMPLES_DIR}/sample-keys
	${INSTALL_DATA_DIR} ${SAMPLES_DIR}/sample-scripts
	${INSTALL_DATA_DIR} ${SAMPLES_DIR}/easy-rsa
	@rm -rf ${WRKSRC}/easy-rsa/Windows
	@find ${WRKSRC}/sample-config-files/ -type f \! -name "*.orig" -exec \
		${INSTALL_DATA} {} ${SAMPLES_DIR}/sample-config-files/ \;
	${INSTALL_DATA} ${WRKSRC}/sample-keys/* ${SAMPLES_DIR}/sample-keys/
	${INSTALL_DATA} ${WRKSRC}/sample-scripts/* ${SAMPLES_DIR}/sample-scripts/
	@find ${WRKSRC}/easy-rsa -type f -exec perl -pi -e 's,#!/bin/bash,#!/bin/sh,g' {} \;
	@cp -pR ${WRKSRC}/easy-rsa/* ${SAMPLES_DIR}/easy-rsa/
	@chown -R ${SHAREOWN}:${SHAREGRP} ${SAMPLES_DIR}/easy-rsa/

.include <bsd.port.mk>
