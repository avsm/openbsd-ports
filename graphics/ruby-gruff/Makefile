# $OpenBSD: Makefile,v 1.10 2011/09/16 10:02:38 espie Exp $

COMMENT=		library for making beautiful graphs

DISTNAME=		gruff-0.3.4
REVISION =		4
CATEGORIES=		graphics

HOMEPAGE=		http://nubyonrails.com/pages/gruff/

# MIT
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=		lang/ruby

CONFIGURE_STYLE=	ruby gem

BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		graphics/ruby-rmagick,${MODRUBY_FLAVOR} \
			devel/ruby-hoe,${MODRUBY_FLAVOR}

MODRUBY_REGRESS=	rake

pre-regress:
	@mkdir -p ${WRKSRC}/test/output

.include <bsd.port.mk>
