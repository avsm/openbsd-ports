# $OpenBSD: Makefile,v 1.41 2011/10/19 16:44:34 giovanni Exp $

COMMENT=		open source web analytics software program

DISTNAME=		piwik-1.6
CATEGORIES=		www

HOMEPAGE=		http://www.piwik.org/
MAINTAINER=		Giovanni Bechis <giovanni@openbsd.org>

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		http://builds.piwik.org/

WRKDIST=		${WRKDIR}/piwik/

NO_BUILD=		Yes
NO_REGRESS=		Yes
PKG_ARCH=		*

PREFIX=			/var/www
INSTDIR=		${PREFIX}/piwik/
SUBST_VARS=		INSTDIR

MODULES=	lang/php
RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-gd \
		lang/php/${MODPHP_VERSION},-mysql \
		lang/php/${MODPHP_VERSION},-pdo_mysql

post-patch:
	@find ${WRKSRC} -name "*.orig" -exec rm -f {} \;

do-install:
	@cp -Rp ${WRKDIST} ${INSTDIR}
	@chown -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

.include <bsd.port.mk>
