# $OpenBSD: python.port.mk,v 1.36 2010/08/30 16:35:02 fgsch Exp $
#
#	python.port.mk - Xavier Santolaria <xavier@santolaria.net>
#	This file is in the public domain.

SHARED_ONLY=		Yes

CATEGORIES+=		lang/python

MODPY_VERSION?=		2.6
.if ${MODPY_VERSION} == 2.4
MODPY_VSPEC = >=${MODPY_VERSION},<2.5
.elif ${MODPY_VERSION} == 2.5
MODPY_VSPEC = >=${MODPY_VERSION},<2.6
.elif ${MODPY_VERSION} == 2.6
MODPY_VSPEC = >=${MODPY_VERSION},<2.7
.endif
MODPYSPEC = python-${MODPY_VSPEC}

MODPY_RUN_DEPENDS=	:${MODPYSPEC}:lang/python/${MODPY_VERSION}
MODPY_LIB_DEPENDS=	python${MODPY_VERSION}:${MODPYSPEC}:lang/python/${MODPY_VERSION}
_MODPY_BUILD_DEPENDS=	:${MODPYSPEC}:lang/python/${MODPY_VERSION}

MODPY_BUILDDEP?=	Yes
MODPY_RUNDEP?=		Yes

.if ${NO_BUILD:L} == "no" && ${MODPY_BUILDDEP:L} == "yes"
BUILD_DEPENDS+=		${_MODPY_BUILD_DEPENDS}
.endif
.if ${MODPY_RUNDEP:L} == "yes"
RUN_DEPENDS+=		${MODPY_RUN_DEPENDS}
.endif

.if defined(MODPY_SETUPTOOLS) && ${MODPY_SETUPTOOLS:U} == YES
# The setuptools module provides a package locator (site.py) that is
# required at runtime for the pkg_resources stuff to work
MODPY_SETUPUTILS_DEPEND?=:py-setuptools-*:devel/py-setuptools
MODPY_RUN_DEPENDS+=	${MODPY_SETUPUTILS_DEPEND}
BUILD_DEPENDS+=		${MODPY_SETUPUTILS_DEPEND}
# The setuptools uses test target
REGRESS_TARGET?=	test
.endif

.if !defined(NO_SHARED_LIBS) || ${NO_SHARED_LIBS:U} != YES
MODPY_TKINTER_DEPENDS=	:python-tkinter-${MODPY_VSPEC}:lang/python/${MODPY_VERSION},-tkinter
.endif

MODPY_BIN=		${LOCALBASE}/bin/python${MODPY_VERSION}
MODPY_INCDIR=		${LOCALBASE}/include/python${MODPY_VERSION}
MODPY_LIBDIR=		${LOCALBASE}/lib/python${MODPY_VERSION}
MODPY_SITEPKG=		${MODPY_LIBDIR}/site-packages

MODPY_POST_BUILD_BAD_EGGS = @:
MODPY_PRE_INSTALL_BAD_EGGS = @:
.if defined(MODPY_BADEGGS)
.  for egg in ${MODPY_BADEGGS}
MODPY_POST_BUILD_BAD_EGGS += ;ln -sf ${WRKINST}/${egg}.egg-info ${WRKBUILD}/${egg}.egg-info
MODPY_PRE_INSTALL_BAD_EGGS += ;mkdir -p ${WRKINST}/${egg}.egg-info
.  endfor
.endif


# usually setup.py but Setup.py can be found too
MODPY_SETUP?=		setup.py

# build or build_ext are commonly used
MODPY_DISTUTILS_BUILD?=		build --build-base=${WRKSRC}

.if defined(MODPY_SETUPTOOLS) && ${MODPY_SETUPTOOLS:U} == YES
MODPY_DISTUTILS_INSTALL?=	install --prefix=${LOCALBASE} \
				--root=${DESTDIR} \
				--single-version-externally-managed
.else
MODPY_DISTUTILS_INSTALL?=	install --prefix=${LOCALBASE} \
				--root=${DESTDIR}
.endif

MAKE_ENV+=	CC=${CC}
CONFIGURE_ENV+=	PYTHON="${MODPY_BIN}"

_MODPY_CMD=	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
			${MODPY_BIN} ./${MODPY_SETUP}

SUBST_VARS:=	MODPY_BIN MODPY_EGG_VERSION MODPY_VERSION ${SUBST_VARS}

# dirty way to do it with no modifications in bsd.port.mk
.if empty(CONFIGURE_STYLE)
.  if !target(do-build)
do-build:
	${_MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS}
	${MODPY_POST_BUILD_BAD_EGGS}
.  endif

# extra documentation or scripts should be installed via post-install
.  if !target(do-install)
do-install:
	${MODPY_PRE_INSTALL_BAD_EGGS}
	${_MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS} \
		${MODPY_DISTUTILS_INSTALL} ${MODPY_DISTUTILS_INSTALLARGS}
.  endif

# setuptools supports regress testing from setup.py using a standard target
.  if !target(do-regress) && \
      defined(MODPY_SETUPTOOLS) && ${MODPY_SETUPTOOLS:U} == YES
do-regress:
	${_MODPY_CMD} ${REGRESS_TARGET}
.  endif

.endif
