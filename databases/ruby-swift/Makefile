# $OpenBSD: Makefile,v 1.4 2011/09/16 08:48:05 espie Exp $

COMMENT =	fast database API and ORM for ruby 1.9

DISTNAME =	swift-0.9.1
CATEGORIES =	databases
REVISION =	0

MAINTAINER =	Jeremy Evans <jeremy@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =	lang/ruby
FLAVOR =	ruby19

WANTLIB =	c m stdc++ e2fs-uuid pcrecpp
BUILD_DEPENDS =	${RUN_DEPENDS}
RUN_DEPENDS =	databases/dbic++>=0.5.4

CONFIGURE_STYLE = ruby gem ext

.include <bsd.port.mk>
