# $OpenBSD: Makefile,v 1.4 2010/12/03 11:46:46 ajacoutot Exp $

COMMENT = 	storage class for Catalyst Authentication using DBIx::Class

MODULES =	cpan
DISTNAME =	Catalyst-Authentication-Store-DBIx-Class-0.104
REVISION =	0
CATEGORIES =	security

MAINTAINER =	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

RUN_DEPENDS =	databases/p5-DBIx-Class \
		security/p5-Catalyst-Plugin-Authentication>=0.10006 \
		www/p5-Catalyst-Runtime
BUILD_DEPENDS =	${RUN_DEPENDS}
USE_GROFF =	Yes

MAKE_ENV =	TEST_POD=Yes

.include <bsd.port.mk>
