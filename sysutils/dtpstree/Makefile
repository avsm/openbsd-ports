# $OpenBSD: Makefile,v 1.3 2010/11/20 17:22:40 espie Exp $

COMMENT =		display a tree of processes

DISTNAME =		dtpstree-1.0.3
CATEGORIES =		sysutils

HOMEPAGE =		http://code.douglasthrift.net/trac/dtpstree

MAINTAINER =		Douglas William Thrift <douglas@douglasthrift.net>

# Apache 2.0
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		c kvm m ncurses stdc++

MASTER_SITES =		http://code.douglasthrift.net/files/dtpstree/ \
			http://apt.douglasthrift.net/files/dtpstree/
EXTRACT_SUFX =		.tar.bz2

SEPARATE_BUILD =	concurrent

MAKE_FILE =		GNUmakefile
USE_GMAKE =		Yes
USE_GROFF =		Yes
CONFIGURE_STYLE =	gnu

NO_REGRESS =		Yes

.include <bsd.port.mk>
