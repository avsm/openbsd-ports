# $OpenBSD: Makefile,v 1.8 2011/09/16 11:41:39 espie Exp $

COMMENT =	library for verifying and serving OpenID identities

DISTNAME = ruby-${PKGNAME}
PKGNAME = yadis-0.3.4
REVISION = 4
CATEGORIES = security

MAINTAINER =	Paul Irofti <pirofti@openbsd.org>

# Apache License
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MODULES =	lang/ruby

CONFIGURE_STYLE = ruby gem

do-regress:
	@cd ${WRKBUILD}/test && ${RUBY} -I${WRKBUILD}/lib runtests.rb

.include <bsd.port.mk>
