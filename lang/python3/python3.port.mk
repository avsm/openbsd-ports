# $OpenBSD: python3.port.mk,v 1.1.1.1 2011/06/27 18:44:13 rpointel Exp $
#
#	python.port.mk - Xavier Santolaria <xavier@santolaria.net>
#	This file is in the public domain.

SHARED_ONLY=		Yes

CATEGORIES+=		lang/python3

MODPY_VERSION?=	3.2
.if ${MODPY_VERSION} == 3.2
MODPY_VSPEC = >=${MODPY_VERSION},<3.3
.endif
MODPYSPEC = python3-${MODPY_VSPEC}

MODPY_WANTLIB=		python${MODPY_VERSION}m
MODPY_RUN_DEPENDS=	${MODPYSPEC}:lang/python3/${MODPY_VERSION}
MODPY_LIB_DEPENDS=	${MODPY_RUN_DEPENDS}
_MODPY_BUILD_DEPENDS=	${MODPY_RUN_DEPENDS}

MODPY_BUILDDEP?=	Yes
MODPY_RUNDEP?=		Yes

.if ${NO_BUILD:L} == "no" && ${MODPY_BUILDDEP:L} == "yes"
BUILD_DEPENDS+=		${_MODPY_BUILD_DEPENDS}
.endif
.if ${MODPY_RUNDEP:L} == "yes"
RUN_DEPENDS+=		${MODPY_RUN_DEPENDS}
.endif

MODPY_PRE_BUILD_STEPS = @:

.if defined(MODPY_DISTRIBUTE) && ${MODPY_DISTRIBUTE:U} == YES
# The setuptools module provides a package locator (site.py) that is
# required at runtime for the pkg_resources stuff to work
MODPY_DISTRIBUTEUTILS_DEPEND?=devel/py3-distribute
MODPY_RUN_DEPENDS+=	${MODPY_DISTRIBUTEUTILS_DEPEND}
BUILD_DEPENDS+=		${MODPY_DISTRIBUTEUTILS_DEPEND}
# The setuptools uses test target
REGRESS_TARGET?=	test
_MODPY_USERBASE =
.else
# Try to detect the case where a port will build regardless of setuptools
# but the final plist will be different if it's present.
_MODPY_DISTRIBUTE_FAKE_DIR =	\
	${WRKDIR}/lib/python${MODPY_VERSION}/site-packages/setuptools
MODPY_PRE_BUILD_STEPS +=	\
	;mkdir -p ${_MODPY_DISTRIBUTE_FAKE_DIR} \
	;exec >${_MODPY_DISTRIBUTE_FAKE_DIR}/__init__.py \
	;echo 'def setup(*args, **kwargs):' \
	;echo '    msg = "OpenBSD ports: MODPY_DISTRIBUTE = Yes is required"' \
	;echo '    raise Exception(msg)' \
	;echo 'Extension = Feature = find_packages = setup'
_MODPY_USERBASE =	${WRKDIR}
.endif

.if !defined(NO_SHARED_LIBS) || ${NO_SHARED_LIBS:U} != YES
MODPY_TKINTER_DEPENDS=	STEM-${MODPY_VSPEC}:lang/python3/${MODPY_VERSION},-tkinter
.endif

MODPY_BIN=		${LOCALBASE}/bin/python${MODPY_VERSION}
MODPY_INCDIR=		${LOCALBASE}/include/python${MODPY_VERSION}
MODPY_LIBDIR=		${LOCALBASE}/lib/python${MODPY_VERSION}
MODPY_SITEPKG=		${MODPY_LIBDIR}/site-packages

.if defined(MODPY_BADEGGS)
.  for egg in ${MODPY_BADEGGS}
MODPY_PRE_BUILD_STEPS += ;mkdir -p ${WRKBUILD}/${egg}.egg-info
.  endfor
.endif


# usually setup.py but Setup.py can be found too
MODPY_SETUP?=		setup.py

# build or build_ext are commonly used
MODPY_DISTUTILS_BUILD?=		build --build-base=${WRKSRC}

.if defined(MODPY_DISTRIBUTE) && ${MODPY_DISTRIBUTE:U} == YES
MODPY_DISTUTILS_INSTALL?=	install --prefix=${LOCALBASE} \
				--root=${DESTDIR} \
				--single-version-externally-managed
.else
MODPY_DISTUTILS_INSTALL?=	install --prefix=${LOCALBASE} \
				--root=${DESTDIR}
.endif

MAKE_ENV+=	CC=${CC} PYTHONUSERBASE=${_MODPY_USERBASE}
CONFIGURE_ENV+=	PYTHON="${MODPY_BIN}"

_MODPY_CMD=	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
			${MODPY_BIN} ./${MODPY_SETUP}

SUBST_VARS:=	MODPY_BIN MODPY_EGG_VERSION MODPY_VERSION ${SUBST_VARS}

# set MODPY_BIN for executable scripts
MODPY_BIN_ADJ=	perl -pi \
		-e '$$. == 1 && s|^.*env python.*$$|\#!${MODPY_BIN}|;' \
		-e '$$. == 1 && s|^.*bin/python.*$$|\#!${MODPY_BIN}|;' \
		-e 'close ARGV if eof;'

MODPY_ADJ_FILES?=
.if !empty(MODPY_ADJ_FILES)
MODPYTHON_pre-configure += for f in ${MODPY_ADJ_FILES}; do \
	${MODPY_BIN_ADJ} ${WRKSRC}/$${f}; done
.endif

# dirty way to do it with no modifications in bsd.port.mk
.if empty(CONFIGURE_STYLE)
.  if !target(do-build)
do-build:
	${MODPY_PRE_BUILD_STEPS}
	${_MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS}
.  endif

# extra documentation or scripts should be installed via post-install
.  if !target(do-install)
do-install:
	${_MODPY_CMD} ${MODPY_DISTUTILS_BUILD} ${MODPY_DISTUTILS_BUILDARGS} \
		${MODPY_DISTUTILS_INSTALL} ${MODPY_DISTUTILS_INSTALLARGS}
.  endif

# setuptools supports regress testing from setup.py using a standard target
.  if !target(do-regress) && \
      defined(MODPY_DISTRIBUTE) && ${MODPY_DISTRIBUTE:U} == YES
do-regress:
	${_MODPY_CMD} ${REGRESS_TARGET}
.  endif

.endif
