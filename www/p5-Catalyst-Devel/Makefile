# $OpenBSD: Makefile,v 1.13 2010/11/22 08:36:50 espie Exp $

COMMENT= 	Catalyst development tools

MODULES=	cpan
DISTNAME=	Catalyst-Devel-1.28
CATEGORIES=	www
USE_GROFF =	Yes

HOMEPAGE=	http://www.catalystframework.org/

MAINTAINER=	Simon Bertrang <simon@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	devel/p5-Class-Accessor \
		devel/p5-Config-General \
		devel/p5-File-ChangeNotify \
		devel/p5-File-Copy-Recursive \
		devel/p5-File-ShareDir \
		devel/p5-Moose \
		devel/p5-MooseX-Emulate-Class-Accessor-Fast \
		devel/p5-Module-Install \
		devel/p5-Path-Class \
		devel/p5-namespace-autoclean \
		devel/p5-namespace-clean \
		textproc/p5-Template \
		www/p5-Catalyst-Action-RenderView \
		www/p5-Catalyst-Plugin-ConfigLoader \
		www/p5-Catalyst-Plugin-Static-Simple>=0.28 \
		www/p5-Catalyst-Runtime>=5.80015

MAKE_ENV=	TEST_POD=Yes

CONFIGURE_ARGS+=--skipdeps

.include <bsd.port.mk>
