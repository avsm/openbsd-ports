# $OpenBSD: ghc.port.mk,v 1.19 2011/04/11 14:30:32 kili Exp $
# Module for Glasgow Haskell Compiler

# Not yet ported to other architectures
ONLY_FOR_ARCHS =	i386 amd64

MODGHC_VER =		7.0.3
SUBST_VARS +=		MODGHC_VER

MODGHC_BIN =		${LOCALBASE}/bin/ghc

# The following is for depending ports only.  GHC itself just needs
# MODGHC_VER and ONLY_FOR_ARCHS. This is a little bit ugly, but
# depending ports using CABAL tend to install into locations as
# lib/Foo-${FooVersion}/ghc-${MODGHC_VER}, so they need the exact
# version of ghc. Depending ports thus need full depends specs,
# i.e. RUN_DEPENDS = :ghc-${MODGHC_VER}:lang/ghc, and not
# just ::lang/ghc.
.if ${PKGPATH} != "lang/ghc"
BUILD_DEPENDS +=	lang/ghc

# Set to "cabal" to get the typical Cabal targets defined. Add "haddock"
# to generate API documentation using Haddock. Add "register" to create
# and include register/unregister scripts (you'll still have to add the
# necessary tags to your PLIST by hand).
# Add "nort" if the port doesn't depend on the GHC runtime. This will
# also turn off the default "hs-" prefix for PKGNAME.
# Finally, set it to or add "hackage" if the distfiles are available on
# hackage.haskell.org.

MODGHC_BUILD ?=

. if !${MODGHC_BUILD:L:Mnort}
PKGNAME ?=		hs-${DISTNAME}
RUN_DEPENDS +=		lang/ghc=${MODGHC_VER}
CATEGORIES +=		lang/ghc
. endif

. if ${MODGHC_BUILD:L:Mhackage}
MODGHC_HACKAGE_NAME =		${DISTNAME:C,-[0-9.]*$,,}
MODGHC_HACKAGE_VERSION =	${DISTNAME:C,.*-([0-9.]*)$,\1,}
HOMEPAGE ?=			http://hackage.haskell.org/package/${MODGHC_HACKAGE_NAME}
MASTER_SITES =			http://hackage.haskell.org/packages/archive/${MODGHC_HACKAGE_NAME}/${MODGHC_HACKAGE_VERSION}/
SUBST_VARS +=			DISTNAME MODGHC_HACKAGE_VERSION
. endif

. if ${MODGHC_BUILD:L:Mcabal}
MODGHC_SETUP_SCRIPT ?=		Setup.lhs Setup.hs
MODGHC_SETUP_PROG ?=		${WRKSRC}/Setup
MODGHC_SETUP_CONF_ARGS ?=
MODGHC_SETUP_CONF_ENV ?=

.  if !${MODGHC_BUILD:L:Mnort}
MODGHC_SETUP_CONF_ARGS +=	--datasubdir=hs-\$$pkgid
MODGHC_SETUP_CONF_ARGS +=	--docdir=\$$datadir/doc/hs-\$$pkgid
MODGHC_SETUP_CONF_ARGS +=	--libsubdir=ghc/\$$pkgid
.  endif

.  if ${MODGHC_BUILD:L:Mhaddock}
BUILD_DEPENDS +=		devel/haddock \
				lang/ghc,-doc
.  endif

# Little hack to let ports still add CONFIGURE_STYLE = autoconf and go
# without a do-configure: target (some Haskell ports are built with
# Cabal but use autohell for the documentation):
MODCABAL_configure = \
	cd ${WRKSRC} && \
	for s in ${MODGHC_SETUP_SCRIPT}; do \
		test -f "$$s" && \
		printf '\#!/bin/sh\nexec %s %s "$$@"\n' \
			${LOCALBASE}/bin/runghc \
			$$s > ${MODGHC_SETUP_PROG} && \
		chmod +x ${MODGHC_SETUP_PROG} && \
		break; \
	done && \
	cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} ${MODGHC_SETUP_CONF_ENV} \
		${MODGHC_SETUP_PROG} \
			configure -g -O --prefix=${PREFIX} \
			${MODGHC_SETUP_CONF_ARGS}

CONFIGURE_STYLE +=		CABAL

.  if !target(do-build)
do-build:
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} build
.   if ${MODGHC_BUILD:L:Mhaddock}
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} haddock
.   endif
.   if ${MODGHC_BUILD:L:Mregister}
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} register --gen-script \
			--pkgpath="${PKGPATH}"
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} unregister --gen-script
.   endif
.  endif

.  if !target(do-install)
do-install:
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} copy --destdir=${DESTDIR}
.   if ${MODGHC_BUILD:L:Mregister}
	@${INSTALL_SCRIPT} ${WRKBUILD}/register.sh ${PREFIX}/lib/ghc/${DISTNAME}
	@${INSTALL_SCRIPT} ${WRKBUILD}/unregister.sh ${PREFIX}/lib/ghc/${DISTNAME}
.   endif
.  endif

.  if !target(do-regress)
do-regress:
	@cd ${WRKBUILD} && exec ${SETENV} ${MAKE_ENV} \
		${MODGHC_SETUP_PROG} test
.  endif
. endif
.endif
