# $OpenBSD: Makefile,v 1.15.2.1 2001/05/29 15:30:14 naddy Exp $

DISTNAME=	snapshot-20010329
PKGNAME=	postfix-${DISTNAME}

MASTER_SITE_SUBDIR=	experimental

FLAVORS=	pcre sasl ldap
FLAVOR?=

.if ${FLAVOR:L:Mpcre}
LIB_DEPENDS+=	pcre::devel/pcre

MAKE_CCARGS+=	-I${LOCALBASE}/include -DHAS_PCRE
MAKE_AUXLIBS+=	-L${LOCALBASE}/lib -lpcre
.endif

.if ${FLAVOR:L:Msasl}
LIB_DEPENDS+=	sasl::security/cyrus-sasl

MAKE_CCARGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/sasl -DUSE_SASL_AUTH 
MAKE_AUXLIBS+=	-L${LOCALBASE}/lib -lsasl -lkrb
.endif

.if ${FLAVOR:L:Mldap}
LIB_DEPENDS+=	ldap::databases/openldap
MAKE_CCARGS+=	-I${LOCALBASE}/include -DHAS_LDAP
MAKE_AUXLIBS+=	-L${LOCALBASE}/lib -lldap -llber
.endif

.include <bsd.port.mk>
