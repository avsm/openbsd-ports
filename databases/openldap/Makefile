# $OpenBSD: Makefile,v 1.108 2011/09/21 14:07:47 pea Exp $

COMMENT-main=	Open source LDAP software (client)
COMMENT-server=	Open source LDAP software (server)

DISTNAME=		openldap-2.4.26
PKGNAME-main=		${DISTNAME:S/-/-client-/}
PKGNAME-server=		${DISTNAME:S/-/-server-/}

SHARED_LIBS +=	lber                 11.0      # .9.1
SHARED_LIBS +=	ldap                 11.1      # .9.1
SHARED_LIBS +=	ldap_r               11.1      # .9.1
SHARED_LIBS +=	lber-2.4             11.0      # .9.1
SHARED_LIBS +=	ldap-2.4             11.1      # .9.1
SHARED_LIBS +=	ldap_r-2.4           11.1      # .9.1
CATEGORIES=	databases net

HOMEPAGE=	http://www.openldap.org/

# OpenLDAP Public License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes 
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += c crypto ssl asn1 com_err gssapi krb5 sasl2 

MASTER_SITES=	http://mirror.switch.ch/ftp/mirror/OpenLDAP/openldap-release/ \
		http://gd.tuwien.ac.at/infosys/network/OpenLDAP/openldap-release/ \
		http://mirror.aarnet.edu.au/pub/openldap/openldap-release/ \
		ftp://ftp.OpenLDAP.org/pub/OpenLDAP/openldap-release/ \
		http://ftp.ntua.gr/mirror/OpenLDAP/openldap-release/

EXTRACT_SUFX=		.tgz

SEPARATE_BUILD=		concurrent
AUTOCONF_VERSION=	2.65
CONFIGURE_STYLE=	autoconf
USE_GROFF=		Yes

CONFIGURE_ARGS+=	${CONFIGURE_SHARED} \
			--localstatedir="/var" \
			--enable-ipv6 \
			--with-tls=openssl

# slapd options
CONFIGURE_ARGS+=	--enable-slapd \
			--enable-cleartext \
			--enable-crypt \
			--enable-rewrite \
			--enable-wrappers \
			--with-cyrus-sasl \
			--enable-spasswd

# slapd modules
CONFIGURE_ARGS+=	--enable-bdb \
			--enable-dnssrv \
			--enable-hdb \
			--enable-ldap \
			--enable-meta \
			--enable-monitor \
			--enable-null \
			--enable-passwd \
			--enable-perl \
			--enable-shell \
			--enable-overlays

MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/build

REGRESS_TARGET=	test

MULTI_PACKAGES=	-main -server

LIB_DEPENDS +=		security/cyrus-sasl2
WANTLIB +=		sasl2
CPPFLAGS +=		-I${LOCALBASE}/include/sasl

LIB_DEPENDS-server =	${LIB_DEPENDS-main} \
			textproc/icu4c \
			databases/db/v4
			
CONFIGURE_ENV +=	CPPFLAGS="-I${LOCALBASE}/include/sasl -I${LOCALBASE}/include/db4 -I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib/db4 -L${LOCALBASE}/lib"

RUN_DEPENDS-server=	${BASE_PKGPATH}
WANTLIB-server += 	${WANTLIB} perl util wrap m pthread icudata icuuc
WANTLIB-server += 	stdc++ lib/db4/db>=4

USE_LIBTOOL=	Yes

pre-build:
	@cd ${WRKBUILD}; ${MAKE_PROGRAM} depend

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/openldap
	${INSTALL_DATA} ${DESTDIR}${SYSCONFDIR}/openldap/*.conf \
		${PREFIX}/share/examples/openldap
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/openldap/schema
	${INSTALL_DATA} ${DESTDIR}${SYSCONFDIR}/openldap/schema/*.schema \
		 ${PREFIX}/share/examples/openldap/schema
	${INSTALL_DATA} ${WRKSRC}/servers/slapd/DB_CONFIG \
		${PREFIX}/share/examples/openldap
	@rm -rf ${DESTDIR}${SYSCONFDIR}/openldap

.include <bsd.port.mk>
