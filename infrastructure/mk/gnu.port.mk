#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
# $OpenBSD: gnu.port.mk,v 1.10 2003/02/15 14:06:58 espie Exp $
#	Based on bsd.port.mk, originally by Jordan K. Hubbard.
#	This file is in the public domain.

AUTOCONF_NEW?=	No
.if ${CONFIGURE_STYLE:L:Mautomake}
BUILD_DEPENDS+=		::devel/automake
.endif
.if ${CONFIGURE_STYLE:L:Mautoupdate}
CONFIGURE_STYLE+=autoconf
.endif
.if ${CONFIGURE_STYLE:L:Mautoconf}
BUILD_DEPENDS+=		::devel/metaauto
.  if ${AUTOCONF_NEW:L} == "yes"
AUTOCONF_VERSION=2.52
.  else
AUTOCONF_VERSION?=2.13
.  endif
BUILD_DEPENDS+=::devel/autoconf/${AUTOCONF_VERSION}
AUTOCONF?=			autoconf
AUTOUPDATE?=		autoupdate
AUTOHEADER?=		autoheader
MAKE_FLAGS+=		AUTOCONF='${AUTOCONF}' AUTOHEADER='${AUTOHEADER}'
FAKE_FLAGS+=		AUTOCONF='${AUTOCONF}' AUTOHEADER='${AUTOHEADER}'
AUTOCONF_DIR?=${WRKSRC}
# missing ?= not an oversight
AUTOCONF_ENV=PATH=${PORTPATH} AUTOCONF_VERSION=${AUTOCONF_VERSION}
MAKE_ENV+=AUTOCONF_VERSION=${AUTOCONF_VERSION}
.endif

MODGNU_CONFIG_GUESS_DIRS?=${WRKSRC}

MODGNU_configure =
.for _d in ${MODGNU_CONFIG_GUESS_DIRS}
MODGNU_configure += cp -f ${PORTSDIR}/infrastructure/db/config.guess ${_d};
MODGNU_configure += chmod a+rx ${_d}/config.guess;
MODGNU_configure += cp -f ${PORTSDIR}/infrastructure/db/config.sub ${_d};
MODGNU_configure += chmod a+rx ${_d}/config.sub;
.endfor
MODGNU_configure += ${MODSIMPLE_configure}

.if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS+=	--prefix='$${${DESTDIRNAME}}${PREFIX}'
.else
CONFIGURE_ARGS+=	--prefix='${PREFIX}'
.endif

.if empty(CONFIGURE_STYLE:L:Mold)
.  if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS+=	--sysconfdir='$${${DESTDIRNAME}}${SYSCONFDIR}'
.  else
CONFIGURE_ARGS+=	--sysconfdir='${SYSCONFDIR}'
.  endif
.endif

REGRESS_TARGET?=	check

PATCH_CHECK_ONLY?=	No
.if ${PATCH_CHECK_ONLY:L} != "yes"
.  if ${CONFIGURE_STYLE:L:Mautoupdate}
MODGNU_post-patch+= cd ${AUTOCONF_DIR} && ${SETENV} ${AUTOCONF_ENV} ${AUTOUPDATE};
.  endif
.  if ${CONFIGURE_STYLE:L:Mautoconf}
MODGNU_post-patch+= cd ${AUTOCONF_DIR} && ${SETENV} ${AUTOCONF_ENV} ${AUTOCONF};
.  endif
.  if !${CONFIGURE_STYLE:L:Mautomake}
MODGNU_post-patch+= ln -s /usr/bin/false ${WRKDIR}/bin/automake;
MODGNU_post-patch+= ln -s /usr/bin/false ${WRKDIR}/bin/aclocal;
.  endif
.endif

