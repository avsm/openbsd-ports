# $OpenBSD: Makefile,v 1.12 2010/12/03 11:46:51 ajacoutot Exp $

COMMENT= 	session framework for catalyst

MODULES=	cpan
DISTNAME=	Catalyst-Plugin-Session-0.19
REVISION=	1
CATEGORIES=	www
USE_GROFF =	Yes

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	www/p5-Catalyst-Runtime \
		devel/p5-Object-Signature
REGRESS_DEPENDS=devel/p5-Test-Deep \
		devel/p5-Test-Exception \
		devel/p5-Test-MockObject \
		www/p5-Catalyst-Plugin-Session-State-Cookie \
		devel/p5-Test-WWW-Mechanize-Catalyst

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
