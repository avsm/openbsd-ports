# $OpenBSD: Makefile,v 1.9 2010/12/03 11:46:51 ajacoutot Exp $

COMMENT= 	plugin to Data::FormValidator for catalyst

MODULES=	cpan
DISTNAME=	Catalyst-Plugin-FormValidator-0.02
REVISION=	2
CATEGORIES=	www
USE_GROFF =	Yes

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	www/p5-Catalyst-Runtime \
		devel/p5-Data-FormValidator

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
