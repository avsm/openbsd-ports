# $OpenBSD: Makefile,v 1.12 2010/12/03 11:46:51 ajacoutot Exp $

COMMENT= 	catalyst file storage backend for session data

MODULES=	cpan
DISTNAME=	Catalyst-Plugin-Session-Store-File-0.13
REVISION=	2
CATEGORIES=	www
USE_GROFF =	Yes

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	devel/p5-Cache-Cache \
		devel/p5-Class-Data-Inheritable \
		www/p5-Catalyst-Plugin-Session
BUILD_DEPENDS=	${RUN_DEPENDS}

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
