# $OpenBSD: Makefile,v 1.12 2010/12/03 11:46:48 ajacoutot Exp $

COMMENT= 	Template Toolkit views for Catalyst

DISTNAME=	Catalyst-View-TT-0.29
REVISION=	0
CATEGORIES=	textproc

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	cpan
USE_GROFF =	Yes

RUN_DEPENDS=	devel/p5-Data-Dump \
		devel/p5-Class-Accessor \
		devel/p5-MRO-Compat \
		devel/p5-Path-Class \
		textproc/p5-Template-Timer \
		www/p5-Catalyst-Runtime
BUILD_DEPENDS=	${RUN_DEPENDS}

MAKE_ENV=	TEST_POD=Yes

.include <bsd.port.mk>
