# $OpenBSD: gconf2.port.mk,v 1.3 2009/06/11 16:42:09 ajacoutot Exp $

MODGCONF2_LIB_DEPENDS=	gconf-2::devel/gconf2
MODGCONF2_BUILD_DEPENDS=:gconf2-*:devel/gconf2
MODGCONF2_RUN_DEPENDS=	:gconf2-*:devel/gconf2

MODGCONF2_LIBDEP?=	Yes
MODGCONF2_RUNDEP?=	Yes

.if ${MODGCONF2_LIBDEP:L} == "yes"
LIB_DEPENDS+=	${MODGCONF2_LIB_DEPENDS}
.elif ${MODGCONF2_RUNDEP:L} == "yes"
RUN_DEPENDS+=	${MODGCONF2_RUN_DEPENDS}
.endif

BUILD_DEPENDS+=	${MODGCONF2_BUILD_DEPENDS}

.if defined(MODGCONF2_SCHEMAS_DIR)
SCHEMAS_INSTDIR=share/schemas/${MODGCONF2_SCHEMAS_DIR:L}
SUBST_VARS+=	SCHEMAS_INSTDIR
CONFIGURE_ARGS+=--with-gconf-schema-file-dir=${LOCALBASE}/${SCHEMAS_INSTDIR}
.endif

MODGCONF2_post-patch+=	ln -s /usr/bin/true ${WRKDIR}/bin/gconftool-2
