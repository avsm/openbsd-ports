# $OpenBSD: Makefile,v 1.22.2.1 2003/03/05 01:30:02 margarida Exp $

COMMENT=	"highly flexible sniffer/NIDS"

DISTNAME=	snort-1.9.1
CATEGORIES=	net security
MASTER_SITES=	${HOMEPAGE}/dl/

HOMEPAGE=       http://www.snort.org

MAINTAINER=	Brian Caswell <bmc@openbsd.org>

# License: GPL
PERMIT_PACKAGE_CDROM= 	Yes
PERMIT_PACKAGE_FTP=   	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP= 	Yes

SEPARATE_BUILD=	concurrent
CONFIGURE_STYLE= gnu

FLAVORS=	postgresql mysql smbalert flexresp
FLAVOR?=	

.if ${FLAVOR:L:Mflexresp}
LIB_DEPENDS+=	net::net/libnet
CONFIGURE_ENV+=	LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+= --enable-flexresp
.endif

.if ${FLAVOR:L:Mpostgresql}
LIB_DEPENDS+=	pq.2::databases/postgresql
CONFIGURE_ARGS+= --with-postgresql="${LOCALBASE}"
.endif

.if ${FLAVOR:L:Mmysql}
LIB_DEPENDS+=	lib/mysql/mysqlclient.10:mysql-client-3.23.*:databases/mysql
CONFIGURE_ARGS+= --with-mysql="${LOCALBASE}"
.endif

.if ${FLAVOR:L:Msmbalert}
BUILD_DEPENDS+=	smbclient::net/samba
RUN_DEPENDS+=	smbclient::net/samba
CONFIGURE_ARGS+= --enable-smbalerts
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/snort
	${INSTALL_DATA} ${WRKSRC}/etc/snort.conf ${PREFIX}/share/examples/snort
	${INSTALL_DATA} ${WRKSRC}/etc/sid-msg.map ${PREFIX}/share/examples/snort
	${INSTALL_DATA} ${WRKSRC}/etc/classification.config \
		 ${PREFIX}/share/examples/snort
	${INSTALL_DATA} ${WRKSRC}/etc/reference.config \
		 ${PREFIX}/share/examples/snort
	${INSTALL_DATA} ${WRKSRC}/rules/*.rules ${PREFIX}/share/examples/snort

.include <bsd.port.mk>
