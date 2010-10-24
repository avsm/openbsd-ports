#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
# $OpenBSD: gnu.port.mk,v 1.39 2010/10/24 20:41:23 ajacoutot Exp $
#	Based on bsd.port.mk, originally by Jordan K. Hubbard.
#	This file is in the public domain.

MODGNU_AUTOCONF_DEPENDS = ::devel/metaauto \
	:autoconf-${AUTOCONF_VERSION}:devel/autoconf/${AUTOCONF_VERSION}
MODGNU_AUTOMAKE_DEPENDS = ::devel/metaauto \
	:${_AUTOMAKE_SPEC}:devel/automake/${AUTOMAKE_VERSION}

AUTOMAKE_VERSION ?= 1.4
.if ${AUTOMAKE_VERSION} == 1.4
_AUTOMAKE_SPEC = automake->=${AUTOMAKE_VERSION},<1.5
.elif ${AUTOMAKE_VERSION} == 1.8
_AUTOMAKE_SPEC = automake->=${AUTOMAKE_VERSION},<1.9
.elif ${AUTOMAKE_VERSION} == 1.9
_AUTOMAKE_SPEC = automake->=${AUTOMAKE_VERSION},<1.10
.elif ${AUTOMAKE_VERSION} == 1.10
_AUTOMAKE_SPEC = automake->=${AUTOMAKE_VERSION},<1.11
.endif

.if ${CONFIGURE_STYLE:L:Mautomake}
BUILD_DEPENDS += ${MODGNU_AUTOMAKE_DEPENDS}
MAKE_ENV += AUTOMAKE_VERSION=${AUTOMAKE_VERSION}
.  if ${CONFIGURE_STYLE:L:Mautoupdate}
CONFIGURE_STYLE += autoconf
.  endif
.endif

.if ${CONFIGURE_STYLE:L:Mautoconf}
AUTOCONF_VERSION ?= 2.13
BUILD_DEPENDS += ${MODGNU_AUTOCONF_DEPENDS}
AUTOCONF ?= autoconf
AUTOUPDATE ?= autoupdate
AUTOHEADER ?= autoheader
AUTOCONF_DIR ?= ${WRKSRC}
# missing ?= not an oversight
AUTOCONF_ENV = PATH=${PORTPATH} AUTOCONF_VERSION=${AUTOCONF_VERSION}
MAKE_ENV += AUTOCONF_VERSION=${AUTOCONF_VERSION}
.  if !${CONFIGURE_STYLE:L:Mno-autoheader}
CONFIGURE_STYLE += autoheader
.  endif
.endif
.if !defined(CONFIG_SITE)
CONFIG_SITE = ${PORTSDIR}/infrastructure/db/config.site
.endif
.if !empty(CONFIG_SITE)
CONFIGURE_ENV += CONFIG_SITE='${CONFIG_SITE}'
.endif

MODGNU_CONFIG_GUESS_DIRS ?=${WRKSRC}
MODGNU_SAVE_CACHE ?= No
MODGNU_SAVE_CACHE_LOCATION =${PORTSDIR}/config

MODGNU_configure = for d in ${MODGNU_CONFIG_GUESS_DIRS}; \
	do \
		cp -f ${PORTSDIR}/infrastructure/db/config.guess $$d; \
		chmod a+rx $$d/config.guess; \
		cp -f ${PORTSDIR}/infrastructure/db/config.sub $$d; \
		chmod a+rx $$d/config.sub; \
	done; ${MODSIMPLE_configure}

.if ${MODGNU_SAVE_CACHE:L} == "yes"
MODGNU_configure += ; mkdir -p ${MODGNU_SAVE_CACHE_LOCATION}; \
	cp ${WRKBUILD}/config.cache ${MODGNU_SAVE_CACHE_LOCATION}/${FULLPKGNAME} \
	|| true
.endif

.if ${CONFIGURE_STYLE:L:Mgnu}
CONFIGURE_ENV += MKDIR_P='mkdir -p'
.  if ${MODGNU_SAVE_CACHE:L} == "yes"
CONFIGURE_ARGS += --cache-file=${WRKBUILD}/config.cache
.  endif
.  if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS += --prefix='$${${DESTDIRNAME}}${PREFIX}'
.  else
CONFIGURE_ARGS += --prefix='${PREFIX}'
.  endif

.  if empty(CONFIGURE_STYLE:L:Mold)
.    if ${CONFIGURE_STYLE:L:Mdest}
CONFIGURE_ARGS += --sysconfdir='$${${DESTDIRNAME}}${SYSCONFDIR}'
CONFIGURE_ARGS += --mandir='$${${DESTDIRNAME}}${PREFIX}/man'
CONFIGURE_ARGS += --infodir='$${${DESTDIRNAME}}${PREFIX}/info'
.    else
CONFIGURE_ARGS += --sysconfdir='${SYSCONFDIR}'
CONFIGURE_ARGS += --mandir='${PREFIX}/man'
CONFIGURE_ARGS += --infodir='${PREFIX}/info'
.    endif
.  endif
.endif

REGRESS_TARGET ?= check

# internal stuff to run on each directory.
MODGNU_post-patch = for d in ${AUTOCONF_DIR}; do cd $$d; ${_MODGNU_loop} done;
_MODGNU_loop =

PATCH_CHECK_ONLY ?= No
.if ${PATCH_CHECK_ONLY:L} != "yes"
.  if ${CONFIGURE_STYLE:L:Mautoupdate}
_MODGNU_loop += echo "Running autoupdate-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop += ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOUPDATE};
.  endif
.  if ${CONFIGURE_STYLE:L:Mautoconf}
_MODGNU_loop += if test -f $$d/configure; then \
	grep -iq 'Generated by.*autoconf.*${AUTOCONF_VERSION}' $$d/configure || { \
	echo ">>> Can't find autoconf ${AUTOCONF_VERSION} signature in $$d/configure:"; \
	grep -i 'Generated by.*autoconf' $$d/configure; }; \
	fi;
_MODGNU_loop += echo "Running autoconf-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop += ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOCONF};
.    if ${CONFIGURE_STYLE:L:Mautoheader}
_MODGNU_loop += echo "Running autoheader-${AUTOCONF_VERSION} in $$d";
_MODGNU_loop += ${_SYSTRACE_CMD} ${SETENV} ${AUTOCONF_ENV} ${AUTOHEADER};
.    endif
.    if !${CONFIGURE_STYLE:L:Mautomake}
REORDER_DEPENDENCIES += ${PORTSDIR}/infrastructure/mk/automake.dep
.    endif
.  endif
.endif

MAKE_FLAGS += mkdir_p='mkdir -p --'
# XXX to be killed
MODGNU_SHARED_LIBS ?=
.for _n _e in ${MODGNU_SHARED_LIBS}
.  if defined(LIB${_n}_ALIAS)
MAKE_FLAGS += lib${LIB${_n}_ALIAS}_la_LDFLAGS='-version-info ${LIB${_n}_VERSION:S/./:/}:0 '${_e}
.  else
MAKE_FLAGS += lib${_n}_la_LDFLAGS='-version-info ${LIB${_n}_VERSION:S/./:/}:0 '${_e}
.  endif
.endfor
