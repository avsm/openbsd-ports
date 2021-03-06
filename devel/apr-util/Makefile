# $OpenBSD: Makefile,v 1.31 2011/09/16 09:24:48 espie Exp $

COMMENT=	companion library to APR

V=		1.2.10
DISTNAME=	apr-util-$V
FULLPKGNAME=	apr-util${MT}-$V${FLAVOR_EXT:S/-mt//}
REVISION =	7
SHARED_LIBS +=	aprutil-1${MT}          2.11     # .2.11

CATEGORIES=	devel

MAINTAINER=	Aleksander Piotrowski <alek@openbsd.org>

HOMEPAGE=	http://apr.apache.org/

FLAVORS=	mt ldap
FLAVOR?=

# Apache License 2.0
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_APACHE:=apr/}

WANTLIB=	expat lib/db4/db>=4
LIB_DEPENDS=	databases/db/v4

MODULES=	converters/libiconv		
USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu autoconf
AUTOCONF_VERSION=2.59
CONFIGURE_ARGS=	--with-apr=${LOCALBASE} \
		--with-dbm=db4 \
		--with-berkeley-db=${LOCALBASE}/include/db4:${LOCALBASE}/lib/db4 \
		--with-iconv=${LOCALBASE} \
		--includedir=${LOCALBASE}/include/apr-1${MT}/ \
		--with-apr=${LOCALBASE}/bin/apr-1${MT}-config

.if ${FLAVOR:L:Mldap}
CONFIGURE_ARGS+=	--with-ldap-include=${LOCALBASE}/include \
			--with-ldap-lib=${LOCALBASE}/lib \
			--with-ldap
LIB_DEPENDS+=		databases/openldap
WANTLIB+=		asn1 com_err crypto gssapi krb5 sasl2 ssl lber ldap
.endif

MT?=
.if ${FLAVOR:L:Mmt}
MT=-mt
CONFIGURE_ENV+=	APRUTIL_EXPORT_LIBS=-pthread
LIB_DEPENDS+=	apr-mt-1.2.11:devel/apr,mt
WANTLIB +=	apr-1-mt=3

post-install:
	sed 's/{APRUTIL_LIBNAME}/{APRUTIL_LIBNAME}-mt/g' ${WRKSRC}/apu-config.out > ${PREFIX}/bin/apu-1-mt-config

.else
LIB_DEPENDS+=	apr-1.2.11:devel/apr
WANTLIB+=	apr-1=3
.endif

SUBST_VARS+=	MT
MAKE_ENV+=	MT=${MT}

.include <bsd.port.mk>
