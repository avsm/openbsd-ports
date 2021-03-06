# $OpenBSD: Makefile,v 1.15 2011/09/16 11:13:39 espie Exp $

SHARED_ONLY=		Yes

COMMENT-main=		modern authoritative nameserver
COMMENT-mysql=		mysql database access module for powerdns
COMMENT-pgsql=		pgsql database access module for powerdns
COMMENT-sqlite=		sqlite database access module for powerdns
COMMENT-sqlite3=	sqlite3 database access module for powerdns
COMMENT-ldap=		ldap module for powerdns

V=			2.9.22
DISTNAME=		pdns-${V}
PKGNAME=		powerdns-${V}
PKGNAME-main=		powerdns-${V}
PKGNAME-mysql=		powerdns-mysql-${V}
PKGNAME-pgsql=		powerdns-pgsql-${V}
PKGNAME-sqlite= 	powerdns-sqlite-${V}
PKGNAME-sqlite3=	powerdns-sqlite3-${V}
PKGNAME-ldap=		powerdns-ldap-${V}
CATEGORIES=		net
HOMEPAGE=		http://www.powerdns.com/

REVISION-main=		0
REVISION-mysql =	0
REVISION-pgsql =	0
REVISION-sqlite =	0
REVISION-sqlite3 =	0
REVISION-ldap =		0

MULTI_PACKAGES=		-main

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB-main=		c m pthread stdc++ z

MASTER_SITES=		http://downloads.powerdns.com/releases/

USE_GROFF =		Yes
NO_REGRESS=		Yes

BUILD_DEPENDS=		devel/boost

PSEUDO_FLAVORS+=	no_mysql no_pgsql no_sqlite no_sqlite3
FLAVOR?=

BACKENDS=

# MySQL
.if ${FLAVOR:L:Mno_mysql}
CONFIGURE_ARGS+=	--without-mysql
.else
MULTI_PACKAGES+=	-mysql
CONFIGURE_ARGS+=	--with-mysql=${LOCALBASE}
LIB_DEPENDS-mysql=	databases/mysql
RUN_DEPENDS-mysql=	${FULLPKGNAME-main}:net/powerdns
WANTLIB-mysql+= 	crypto m ssl z lib/mysql/mysqlclient>=10
BACKENDS+=		gmysql
.endif

# PostgreSQL
.if ${FLAVOR:L:Mno_pgsql}
CONFIGURE_ARGS+=	--without-pgsql
.else
MULTI_PACKAGES+=	-pgsql
CONFIGURE_ARGS+=	--with-pgsql=${LOCALBASE} \
			--with-pgsql-includes=${LOCALBASE}/include/postgresql
LIB_DEPENDS-pgsql=	databases/postgresql,-main
RUN_DEPENDS-pgsql=	${FULLPKGNAME-main}:net/powerdns
WANTLIB-pgsql=		crypto ssl z pq>=2
BACKENDS+=		gpgsql
.endif

# SQLite
.if ${FLAVOR:L:Mno_sqlite}
CONFIGURE_ARGS+=	--without-sqlite
.else
MULTI_PACKAGES+=	-sqlite
CONFIGURE_ARGS+=	--with-sqlite=${LOCALBASE} \
			--with-sqlite-includes=${LOCALBASE}/include
LIB_DEPENDS-sqlite=	databases/sqlite
RUN_DEPENDS-sqlite=	${FULLPKGNAME-main}:net/powerdns
WANTLIB-sqlite+=	z sqlite>=8 
BACKENDS+=		gsqlite
.endif

# SQLite3
.if ${FLAVOR:L:Mno_sqlite3}
CONFIGURE_ARGS+=	--without-sqlite3
.else
MULTI_PACKAGES+=	-sqlite3
CONFIGURE_ARGS+=	--with-sqlite3=${LOCALBASE} \
			--with-sqlite3-includes=${LOCALBASE}/include
LIB_DEPENDS-sqlite3=	databases/sqlite3
RUN_DEPENDS-sqlite3=	${FULLPKGNAME-main}:net/powerdns
WANTLIB-sqlite3+=	z sqlite3>=8
BACKENDS+=		gsqlite3
.endif

# LDAP
.if ${FLAVOR:L:Mno_ldap}
CONFIGURE_ARGS+=	--without-ldap
.else
MULTI_PACKAGES+=	-ldap
LIB_DEPENDS-ldap=	databases/openldap
RUN_DEPENDS-ldap=	${FULLPKGNAME-main}:net/powerdns
CONFIGURE_ARGS+=	--with-ldap=${LOCALBASE} \
			--with-ldap-includes=${LOCALBASE}/include
WANTLIB-ldap+=		asn1 com_err crypto gssapi krb5 sasl2 ssl z lber ldap_r
BACKENDS+=		ldap
.endif

USE_LIBTOOL=		Yes

BUILD_DEPENDS+=          ${MODGNU_AUTOCONF_DEPENDS}

AUTOCONF_VERSION=	2.61

CONFIGURE_STYLE=	gnu autoconf
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+=	--enable-shared=no \
			--libdir="${PREFIX}/lib/powerdns" \
			--with-modules="geo" \
			--with-dynmodules="${BACKENDS}" \
			--disable-recursor # OpenBSD lacks ucontext.h, see PR 5099

EXAMPLE_TABLES= 	tables-mysql.sql \
			tables-pgsql.sql \
			tables-sqlite.sql
EXAMPLE_DIR=		${PREFIX}/share/examples/powerdns/

post-install:
	${INSTALL_DATA_DIR} ${EXAMPLE_DIR}
.for t in ${EXAMPLE_TABLES}
	${INSTALL_DATA} ${FILESDIR}/$t ${EXAMPLE_DIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/pdns/pdns.conf-dist ${EXAMPLE_DIR}
	${INSTALL_DATA} ${FILESDIR}/pdns.conf ${EXAMPLE_DIR}

.include <bsd.port.mk>

CONFIGURE_ARGS+=	--sysconfdir="${SYSCONFDIR}/pdns" \
