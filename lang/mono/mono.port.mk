# $OpenBSD: mono.port.mk,v 1.14 2010/09/16 18:53:29 ajacoutot Exp $

MODMONO_ONLY_FOR_ARCHS=	i386 amd64 # XXX arm powerpc (no support for sigcontext)
ONLY_FOR_ARCHS?=	${MODMONO_ONLY_FOR_ARCHS}

CATEGORIES+=		lang/mono

CONFIGURE_ENV+=		MONO_SHARED_DIR=${TMPDIR}
MAKE_FLAGS+=		MONO_SHARED_DIR=${TMPDIR}

MODMONO_BUILD_DEPENDS=	::lang/mono
MODMONO_RUN_DEPENDS=	::lang/mono

MODMONO_DEPS?=		Yes

.if ${MODMONO_DEPS:L} != "no"
BUILD_DEPENDS+=		${MODMONO_BUILD_DEPENDS}
RUN_DEPENDS+=		${MODMONO_RUN_DEPENDS}
.endif

# A list of files where we have to remove the stupid hardcoded .[0-9] major
# version from library names. 
DLLMAP_FILES?=

.if defined(USE_NANT)
NANT?=		nant
NANT_FLAGS?=

BUILD_DEPENDS+= ::devel/nant

.  if !target(do-build)
do-build:
	@cd ${WRKSRC} && ${MAKE_FLAGS} ${NANT} ${NANT_FLAGS}
.  endif

.  if !target(do-install)
do-install:
	@cd ${WRKSRC} && ${MAKE_FLAGS} ${NANT} ${NANT_FLAGS} -D:prefix="${PREFIX}" install
.  endif

.endif

post-configure:
	@for i in ${DLLMAP_FILES}; do \
		perl -pi -e 's,\.so\.[0-9]+,\.so,g' ${WRKSRC}/$$i; done
