# $OpenBSD: Makefile,v 1.12 2011/06/02 13:41:41 ajacoutot Exp $

COMMENT =	Really Awesome New Cisco confIg Differ

DISTNAME =	rancid-2.3.3
REVISION =	2
EPOCH = 	0
CATEGORIES =	sysutils

HOMEPAGE =	http://www.shrubbery.net/rancid/

MAINTAINER =	Pierre-Emmanuel Andre <pea@openbsd.org>

# Custom
PERMIT_PACKAGE_CDROM =	"not for commercial use"
PERMIT_DISTFILES_CDROM ="not for commercial use"
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =	c util

MASTER_SITES =	ftp://ftp.shrubbery.net/pub/rancid/

RUN_DEPENDS =	lang/expect,no_tk
BUILD_DEPENDS =	${RUN_DEPENDS}

AUTOMAKE_VERSION =	 1.8
CONFIGURE_STYLE = 	automake
CONFIGURE_ARGS =	--prefix=${PREFIX} \
			--localstatedir=/var/rancid/ \
			--disable-mk-localstatedir

USE_GMAKE =	yes
USE_GROFF =	Yes

pre-configure:
	@cp ${FILESDIR}/fnlogin.in ${WRKSRC}/bin/fnlogin.in

.include <bsd.port.mk>
