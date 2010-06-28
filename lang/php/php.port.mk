# $OpenBSD: php.port.mk,v 1.2 2010/06/28 23:29:57 robert Exp $

SHARED_ONLY=		Yes

CATEGORIES+=		lang/php

MODPHP_VERSION?=		5.2
.if ${MODPHP_VERSION} == 5.2
MODPHP_VSPEC = >=${MODPHP_VERSION},<5.3
.else if ${MODPHP_VERSION} == 5.3
MODPHP_VSPEC = >=${MODPHP_VERSION},<5.4
.endif
MODPHPSPEC = php-${MODPHP_VSPEC}

MODPHP_RUN_DEPENDS=	:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}
MODPHP_LIB_DEPENDS=	php${MODPHP_VERSION}:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}
_MODPHP_BUILD_DEPENDS=	:${MODPHPSPEC}:lang/php/${MODPHP_VERSION}

BUILD_DEPENDS+=		${_MODPHP_BUILD_DEPENDS}
RUN_DEPENDS+=		${MODPHP_RUN_DEPENDS}

MODPHP_BIN=		${LOCALBASE}/bin/php-${MODPHP_VERSION}
MODPHP_INCDIR=		${LOCALBASE}/include/php-${MODPHP_VERSION}
MODPHP_LIBDIR=		${LOCALBASE}/lib/php-${MODPHP_VERSION}
