# $OpenBSD: Makefile,v 1.5 2010/11/20 17:22:40 espie Exp $

COMMENT =		data recovery tool

DISTNAME =		ddrescue-1.12

CATEGORIES =		sysutils

HOMEPAGE =		http://www.gnu.org/software/ddrescue/ddrescue.html

# GPLv3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		c m stdc++

MASTER_SITES =		${MASTER_SITE_GNU:=ddrescue/}

BUILD_DEPENDS = 	devel/help2man

CONFIGURE_STYLE =	gnu
ALL_TARGET =		all doc
INSTALL_TARGET =	install install-man
USE_GROFF =		Yes

.include <bsd.port.mk>
