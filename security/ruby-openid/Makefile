# $OpenBSD: Makefile,v 1.15 2011/09/16 11:41:39 espie Exp $

COMMENT=	robust library for verifying and serving OpenID identities

DISTNAME=	ruby-${PKGNAME}
PKGNAME=	openid-2.1.6
REVISION =	5
CATEGORIES=	security

MAINTAINER=	Paul Irofti <pirofti@openbsd.org>

# Apache License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	lang/ruby

CONFIGURE_STYLE=ruby gem

do-regress:
	@cd ${WRKBUILD} && ${RUBY} -rubygems admin/runtests.rb

.include <bsd.port.mk>
