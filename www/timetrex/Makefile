# $OpenBSD: Makefile,v 1.32 2011/10/16 15:07:20 ajacoutot Exp $

COMMENT=	web-based payroll and time management suite

V=		3.5.1
REVISION=	4
DISTNAME=	TimeTrex_Standard_Edition_v${V}
PKGNAME=	timetrex-${V}
CATEGORIES=	www productivity

EXTRACT_SUFX=	.zip

HOMEPAGE=	http://www.timetrex.com/

# AGPLv3 (GNU Affero Public License)
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=timetrex/}

MODULES=	lang/php
RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-gd \
		lang/php/${MODPHP_VERSION},-soap \
		php-mysql-*|php-pgsql-*:lang/php/${MODPHP_VERSION},-mysql \
		www/pear

NO_BUILD=	Yes
NO_REGRESS=	Yes
PKG_ARCH=	*

PREFIX=		/var/www
INSTDIR=	${PREFIX}/timetrex
SUBST_VARS=	INSTDIR MODPHP_BIN

do-install:
	mv ${WRKSRC} ${INSTDIR}
	${SUBST_CMD} ${INSTDIR}/timetrex.ini.php-example_linux
	find ${INSTDIR} -type f -name \*.orig -or -name \*.bak | xargs rm
	find ${INSTDIR} -name \*.beforesubst | xargs rm
	chown -R ${BINOWN}:${BINGRP} ${INSTDIR}

.include <bsd.port.mk>
