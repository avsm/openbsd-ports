#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
# $OpenBSD: gnu.port.mk,v 1.20 2004/10/03 09:51:21 espie Exp $
#	Based on bsd.port.mk, originally by Jordan K. Hubbard.
#	This file is in the public domain.

MODGNU_AUTOCONF_DEPENDS=	::devel/metaauto \
				::devel/autoconf/${AUTOCONF_VERSION}
MODGNU_AUTOMAKE_DEPENDS=	::devel/automake

.if ${CONFIGURE_STYLE:L:Mautomake}
BUILD_DEPENDS+=		${MODGNU_AUTOMAKE_DEPENDS}
.endif
.if ${CONFIGURE_STYLE:L:Mautoupdate}
CONFIGURE_STYLE+=autoconf
.endif

.if ${CONFIGURE_STYLE:L:Mautoconf}
AUTOCONF_VERSION?=	2.13
BUILD_DEPENDS+=		${MODGNU_AUTOCONF_DEPENDS}
AUTOCONF?=			autoconf
AUTOUPDATE?=		autoupdate
AUTOHEADER?=		autoheader
AUTOCONF_DIR?=${WRKSRC}
# missing ?= not an oversight
AUTOCONF_ENV=PATH=${PORTPATH} AUTOCONF_VERSION=${AUTOCONF_VERSION}
MAKE_ENV+=AUTOCONF_VERSION=${AUTOCONF_VERSION}
.  if !${CONFIGURE_STYLE:L:Mno-autoheader}
CONFIGURE_STYLE+=autoheader
.  endif
.endif
CONFIG_SITE?=${PORTSDIR}/infrastructure/db/config.site
.if !empty(CONFIG_SITE)
CONFIGURE_ENV+=CONFIG_SITE='${CONFIG_SITE}'
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

.if ${CONFIGURE_STYLE:L:Mgnu}
.  if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS+=	--prefix='$${${DESTDIRNAME}}${PREFIX}'
.  else
CONFIGURE_ARGS+=	--prefix='${PREFIX}'
.  endif

.  if empty(CONFIGURE_STYLE:L:Mold)
.    if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS+=	--sysconfdir='$${${DESTDIRNAME}}${SYSCONFDIR}'
.    else
CONFIGURE_ARGS+=	--sysconfdir='${SYSCONFDIR}'
.    endif
.  endif
.endif

REGRESS_TARGET?=	check

# internal stuff to run on each directory.
MODGNU_post-patch= for d in ${AUTOCONF_DIR}; do cd $$d; ${_MODGNU_loop} done;
_MODGNU_loop=

PATCH_CHECK_ONLY?=	No
.if ${PATCH_CHECK_ONLY:L} != "yes"
.  if ${CONFIGURE_STYLE:L:Mautoupdate}
_MODGNU_loop+= echo "Running autoupdate-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop+= ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOUPDATE};
.  endif
.  if ${CONFIGURE_STYLE:L:Mautoconf}
_MODGNU_loop+= echo "Running autoconf-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop+= ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOCONF};
.    if ${CONFIGURE_STYLE:L:Mautoheader}
_MODGNU_loop+= echo "Running autoheader-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop+= ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOHEADER};
.    endif
.    if !${CONFIGURE_STYLE:L:Mautomake}
REORDER_DEPENDENCIES+=${PORTSDIR}/infrastructure/mk/automake.dep
.    endif
.  endif
.  endif
