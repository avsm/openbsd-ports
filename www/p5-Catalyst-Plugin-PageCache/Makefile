# $OpenBSD: Makefile,v 1.5 2010/12/03 11:46:51 ajacoutot Exp $

COMMENT =	cache the output of entire pages

MODULES =	cpan
DISTNAME =	Catalyst-Plugin-PageCache-0.21
REVISION =	0
CATEGORIES =	www
USE_GROFF =	Yes

MAINTAINER =	Jim Razmus <jim@bonetruck.org>

# Perl
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

RUN_DEPENDS =	www/p5-Catalyst-Runtime \
		www/p5-Catalyst-Plugin-Cache-FileCache
BUILD_DEPENDS =	${RUN_DEPENDS}

MAKE_ENV +=	TEST_POD=1

.include <bsd.port.mk>
