# $OpenBSD: Makefile,v 1.6 2011/09/16 08:48:02 espie Exp $

SHARED_ONLY=		Yes

COMMENT=		C++ database API

DISTNAME=		deepfryed-dbicpp-g466860f
PKGNAME=		dbic++-0.5.6
CATEGORIES=		databases
HOMEPAGE=		https://github.com/deepfryed/dbicpp
REVISION =		0

SHARED_LIBS +=  dbdmysql                  1.0 # 0.0
SHARED_LIBS +=  dbdpg                     1.0 # 0.0
SHARED_LIBS +=  dbdsqlite3                0.0 # 0.0

# MIT
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

# port-lib-depends-check says that e2fs-uuid and pcrecpp are
# Extra, but they are used in a .a file that doesn't have a
# .so shared library equivalent.
WANTLIB =		e2fs-uuid m mysqlclient pcrecpp pq stdc++ sqlite3

MASTER_SITES=		http://distfiles.bsdfrog.org/

BUILD_DEPENDS=		devel/cmake \
			shells/bash
LIB_DEPENDS=		mysql-client->=5:databases/mysql \
			postgresql-client->=8.4:databases/postgresql \
			sqlite3->=3.7:databases/sqlite3 \
			devel/pcre \
			sysutils/e2fsprogs

CONFIGURE_STYLE=	none
WRKDIST=		${WRKDIR}/deepfryed-dbicpp-4fe45f7

NO_REGRESS=		Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/{CMakeLists.txt,inc/dbic++.h,src/dbic++.cc,pkgconfig/dbic++.pc}

do-build:
	cd ${WRKSRC} && ${SET_ENV} ${MAKE_ENV} ${LOCALBASE}/bin/bash build.sh

do-install:
	cd ${WRKSRC} && ${SET_ENV} ${MAKE_ENV} \
		${LOCALBASE}/bin/bash build.sh -i

.include <bsd.port.mk>
