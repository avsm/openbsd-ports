# $OpenBSD: Makefile,v 1.18 2011/09/16 09:24:57 espie Exp $

COMMENT=	simple rake/rubygems helper for project Rakefiles

DISTNAME=	hoe-2.8.0
CATEGORIES=	devel
REVISION=		0

# mit
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	lang/ruby

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${MODRUBY_RAKE_DEPENDS}

CONFIGURE_STYLE=ruby gem

REGRESS_DEPENDS =	devel/ruby-minitest,${MODRUBY_FLAVOR}
do-regress:
	cd ${WRKSRC} && ${RUBY} -Ilib -rubygems test/test_hoe.rb

.include <bsd.port.mk>
