# $OpenBSD: php.port.mk,v 1.1.1.1 2010/06/27 20:28:44 robert Exp $

SHARED_ONLY=		Yes

CATEGORIES+=		lang/php

MODPHP_VERSION?=		5.2
.if ${MODPHP_VERSION} == 5.2
MODPHP_VSPEC = >=${MODPHP_VERSION},<5.2
.endif
MODPHPSPEC = php-${MODPHP_VSPEC}

MODPHP_RUN_DEPENDS=	:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}
MODPHP_LIB_DEPENDS=	php${MODPHP_VERSION}:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}
_MODPHP_BUILD_DEPENDS=	:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}

MODPHP_RUNDEP?=		Yes

.if ${NO_BUILD:L} == "no"
BUILD_DEPENDS+=		${_MODPHP_BUILD_DEPENDS}
.endif
.if ${MODPHP_RUNDEP:L} == "yes"
RUN_DEPENDS+=		${MODPHP_RUN_DEPENDS}
.endif

MODPHP_BIN=		${LOCALBASE}/bin/php${MODPHP_VERSION}
MODPHP_INCDIR=		${LOCALBASE}/include/php${MODPHP_VERSION}
MODPHP_LIBDIR=		${LOCALBASE}/lib/php${MODPHP_VERSION}
