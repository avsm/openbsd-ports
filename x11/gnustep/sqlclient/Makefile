# $OpenBSD: Makefile,v 1.2 2011/10/15 08:02:23 sebastia Exp $

COMMENT =	GNUstep database abstraction layer

VERSION =	1.5.3
DISTNAME =	SQLClient-${VERSION}
PKGNAME =	gnustep-sqlclient-${VERSION}

SHARED_LIBS +=  SQLClient	0.0

CATEGORIES =	databases

HOMEPAGE =	http://wiki.gnustep.org/index.php/SQLClient

MASTER_SITES =	${MASTER_SITE_GNUSTEP:=libs/}

MODULES =		x11/gnustep
MODGNUSTEP_NEEDS_GUI = 	No
WANTLIB +=		Performance pq ecpg mysqlclient sqlite3
WANTLIB +=		gnustep-base m objc
LIB_DEPENDS +=		x11/gnustep/performance \
			databases/mysql \
			databases/postgresql \
			databases/sqlite3

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--with-additional-include="-I${LOCALBASE}/include \
				-I${LOCALBASE}/include/postgresql" \
			--with-additional-lib=-L${LOCALBASE}/lib
MAKE_FLAGS +=	SQLClient_INTERFACE_VERSION=${LIBSQLClient_VERSION}

.include <bsd.port.mk>
