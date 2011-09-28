# $OpenBSD: bsd.port.arch.mk,v 1.2 2011/09/28 10:03:09 espie Exp $
#
# ex:ts=4 sw=4 filetype=make:
#
#	derived from bsd.port.mk in 2011
#	This file is in the public domain.
#	It is actually a part of bsd.port.mk that can be included early
#	for complicated MULTI_PACKAGES and ARCH-dependent cases.

# _guard against multiple inclusion for bsd.port.mk
_BSD_PORT_ARCH_MK_INCLUDED = Done

# early include of Makefile.inc
.if !defined(_MAKEFILE_INC_DONE)
.  if exists(${.CURDIR}/../Makefile.inc)
.    include "${.CURDIR}/../Makefile.inc"
.  endif
_MAKEFILE_INC_DONE = Yes
.endif

# architecture stuff

ARCH ?!= uname -m

ALL_ARCHS = alpha amd64 arm armish arm hppa hppa64 i386 landisk \
	loongson luna88k m68k m88k mac68k macppc mips64 mips64el \
	mvme68k mvme88k palm sgi socppc sparc sparc64 vax zaurus
# not all powerpc have apm(4), hence the use of macppc
APM_ARCHS = amd64 arm i386 loongson macppc sparc sparc64
LP64_ARCHS = alpha amd64 hppa64 sparc64 mips64 mips64el
NO_SHARED_ARCHS = m88k vax
GCC4_ARCHS = amd64 arm armish beagle gumstix i386 hppa loongson macppc mips64 \
	mips64el mvmeppc palm powerpc sgi socppc sparc sparc64 zaurus
GCC3_ARCHS = alpha hppa64 landisk sh
GCC2_ARCHS = aviion luna88k m68k m88k mac68k mvme68k mvme88k vax

# Set NO_SHARED_LIBS for those machines that don't support shared libraries.
.for _m in ${MACHINE_ARCH}
.  if !empty(NO_SHARED_ARCHS:M${_m})
NO_SHARED_LIBS ?= Yes
.  endif
.endfor
NO_SHARED_LIBS ?= No

# needs multi-packages (and default subpackage) for the rest
.if !defined(MULTI_PACKAGES) || empty(MULTI_PACKAGES)
# XXX let's cheat so we always have MULTI_PACKAGES
MULTI_PACKAGES = -
SUBPACKAGE ?= -
.else
SUBPACKAGE ?= -main
.endif

# build the actual list of subpackages we want
BUILD_PACKAGES =

.for _s in ${MULTI_PACKAGES}

# ONLY_FOR_ARCHS/NOT_FOR_ARCHS are special:
# being undefined is different from being empty
.  if defined(ONLY_FOR_ARCHS)
ONLY_FOR_ARCHS${_s} ?= ${ONLY_FOR_ARCHS}
.  endif
.  if defined(NOT_FOR_ARCHS)
NOT_FOR_ARCHS${_s} ?= ${NOT_FOR_ARCHS}
.  endif

IGNORE${_s} ?=
IGNORE${_s} += ${IGNORE}

# compute _ARCH_OK for ignore
.  if defined(ONLY_FOR_ARCHS${_s})
_ARCH_OK = 0
.    for __ARCH in ${MACHINE_ARCH} ${ARCH}
.      if !empty(ONLY_FOR_ARCHS${_s}:M${__ARCH})
_ARCH_OK = 1
.      endif
.    endfor
.    if ${_ARCH_OK} == 0
.      if ${MACHINE_ARCH} == "${ARCH}"
IGNORE${_s} += "is only for ${ONLY_FOR_ARCHS${_s}}, not ${MACHINE_ARCH}"
.      else
IGNORE${_s} += "is only for ${ONLY_FOR_ARCHS${_s}}, not ${MACHINE_ARCH} \(${ARCH}\)"
.      endif
.    endif
.  endif
.  if defined(NOT_FOR_ARCHS${_s})
_ARCH_OK = 1
.    for __ARCH in ${MACHINE_ARCH} ${ARCH}
.      if !empty(NOT_FOR_ARCHS${_s}:M${__ARCH})
_ARCH_OK = 0
.      endif
.    endfor
.    if ${_ARCH_OK} == 0
IGNORE${_s} += "is not for ${NOT_FOR_ARCHS${_s}}"
.    endif
.  endif

# allow subpackages to vanish on architectures that don't
# support them
.  if empty(IGNORE${_s})
BUILD_PACKAGES += ${_s}
.  endif
.endfor

# allow pseudo-flavors to make subpackages vanish.
.if defined(FLAVOR)
.  for _S in ${BUILD_PACKAGES}
.    for _T in ${_S:S/^-/no_/}
.      if ${FLAVOR:L:M${_T}}
BUILD_PACKAGES := ${BUILD_PACKAGES:N${_S}}
.      endif
.    endfor
.  endfor
.endif
