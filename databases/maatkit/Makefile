# $OpenBSD: Makefile,v 1.17 2011/07/05 14:27:30 giovanni Exp $

COMMENT =	MySQL maatkit tools

DISTNAME =	maatkit-7540
CATEGORIES =	databases perl5

HOMEPAGE =	http://www.maatkit.org/

MAINTAINER =	Giovanni Bechis <giovanni@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	http://maatkit.googlecode.com/files/

RUN_DEPENDS =	databases/p5-DBD-mysql>=1.0 \
		devel/p5-Term-ReadKey>=2.10
BUILD_DEPENDS =	${RUN_DEPENDS}

CONFIGURE_STYLE = perl
PKG_ARCH =	*

USE_GROFF =	Yes

.include <bsd.port.mk>
