# $OpenBSD: Makefile,v 1.62 2011/09/16 11:13:40 espie Exp $

SHARED_ONLY = 		Yes

COMMENT =		highly flexible sniffer/NIDS

# Original URL http://dl.snort.org/downloads/14 redirects to a
# time-limited Amazon S3 url. This would mean a bad distfile name.
# The following hack allows it to work but XXX if updating, the
# MASTER_SITES URL will need to be adjusted, not just DISTNAME.
DISTNAME = 		snort-2.8.6
REVISION=		0
MASTER_SITES = 		http://dl.snort.org/downloads/14?/ \
			http://distfiles.nl/

CATEGORIES =		net security

HOMEPAGE =		http://www.snort.org/

MAINTAINER =		Markus Lude <markus.lude@gmx.de>

# GPLv2
PERMIT_PACKAGE_CDROM = 	Yes
PERMIT_PACKAGE_FTP =   	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = 	Yes
WANTLIB =		c m pcap

USE_LIBTOOL =		Yes
USE_GROFF =		Yes

SEPARATE_BUILD =	concurrent
CONFIGURE_STYLE =	simple
CONFIGURE_ARGS +=	${CONFIGURE_SHARED} \
			--enable-dynamicplugin \
			--enable-ipv6

MAKE_FLAGS =		mandir=${TRUEPREFIX}/man

LIB_DEPENDS =		devel/pcre
WANTLIB +=		pcre

FLAVORS =		postgresql mysql flexresp prelude
FLAVOR ?=	

.if ${FLAVOR:L:Mflexresp}
LIB_DEPENDS +=		net/libdnet
WANTLIB +=		dnet=1
CONFIGURE_ARGS +=	--enable-flexresp2
.endif

.if ${FLAVOR:L:Mpostgresql}
LIB_DEPENDS +=		databases/postgresql
WANTLIB +=		pq>=2
CONFIGURE_ARGS +=	--with-postgresql="${LOCALBASE}"
.endif

.if ${FLAVOR:L:Mmysql}
LIB_DEPENDS +=		databases/mysql
WANTLIB +=		lib/mysql/mysqlclient>=10
CONFIGURE_ARGS +=	--with-mysql-libraries="${LOCALBASE}/lib" \
			--with-mysql-includes="${LOCALBASE}/include"
WANTLIB +=		z
.endif

.if ${FLAVOR:L:Mprelude}
MODULES =		devel/gettext
LIB_DEPENDS +=		security/prelude/libprelude
WANTLIB +=		gcrypt gnutls gpg-error pthread tasn1 z prelude>=8
CONFIGURE_ARGS +=	--enable-prelude
MESSAGE =		${PKGDIR}/MESSAGE-prelude
.endif

CONFIGS	=		classification.config gen-msg.map reference.config \
			sid-msg.map snort.conf threshold.conf unicode.map

PREPROC =		decoder.rules preprocessor.rules

DOCS =			AUTHORS CREDITS README README.* *.pdf TODO USAGE \
			WISHLIST

SCHEMAS = 		create_db2 create_mssql create_mysql \
			create_oracle.sql create_postgresql

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/etc/snort.conf

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/snort
.for i in ${CONFIGS}
	${INSTALL_DATA} ${WRKSRC}/etc/${i} ${PREFIX}/share/examples/snort
.endfor
	${INSTALL_DATA} ${WRKSRC}/doc/generators ${PREFIX}/share/examples/snort

.for i in ${PREPROC}
	${INSTALL_DATA} ${WRKSRC}/preproc_rules/${i} ${PREFIX}/share/examples/snort
.endfor

	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/snort
.for i in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${PREFIX}/share/doc/snort
.endfor
.for i in ${SCHEMAS}
	${INSTALL_DATA} ${WRKSRC}/schemas/${i} ${PREFIX}/share/doc/snort
.endfor

NO_REGRESS =		Yes

.include <bsd.port.mk>
