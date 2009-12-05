# $OpenBSD: Makefile,v 1.4.2.1 2009/12/05 23:18:40 william Exp $

SHARED_ONLY=		Yes

COMMENT=		JSON implementation for Ruby

DISTNAME=		json-1.1.6
PKGNAME=		ruby-${DISTNAME}p0
CATEGORIES=		converters

HOMEPAGE=		http://json.rubyforge.org/

# Ruby license
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${MASTER_SITE_RUBYFORGE:=json/}

MODULES=		lang/ruby

CONFIGURE_STYLE=	ruby gem

WANTLIB=		c m
LIB_DEPENDS=		ruby::lang/ruby

REGRESS_DEPENDS=	::devel/ruby-rake

do-regress:
	@cd ${WRKBUILD} && ${LOCALBASE}/bin/rake test

.include <bsd.port.mk>
