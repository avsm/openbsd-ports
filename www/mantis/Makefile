# $OpenBSD: Makefile,v 1.2.2.1 2007/05/01 16:35:46 sturm Exp $

COMMENT=	"web based bug tracking"

DISTNAME=	mantis-1.0.7
CATEGORIES=	www
HOMEPAGE=	http://www.mantisbugtracker.com/

MAINTAINER=	Marc Balmer <mbalmer@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=mantisbt/}

NO_BUILD=	Yes
NO_REGRESS=	Yes
PKG_ARCH=	*

PREFIX=		/var/www
INSTDIR=	/var/www/mantis
SUBST_VARS=	INSTDIR

RUN_DEPENDS=	:php5-mysql->=5.0.0:www/php5/extensions,-mysql \
		:mini_sendmail-chroot->=1.3.6:mail/mini_sendmail,-chroot

do-install:
	@-test ! -d ${PREFIX}/mantis && mkdir ${PREFIX}/mantis
	@cd ${WRKDIST}; tar cf - . | (cd ${PREFIX}/mantis; tar xf -)
	@echo "<?php \$$g_placeholder = 'yes'; ?>" > \
		${PREFIX}/mantis/config_inc.php.placeholder

.include <bsd.port.mk>
