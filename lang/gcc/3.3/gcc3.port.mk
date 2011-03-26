# $OpenBSD: gcc3.port.mk,v 1.7 2011/03/26 19:13:28 naddy Exp $

MODGCC3_ARCHES?=
# Supported languages for now
_MODGCC3CC=	cc
_MODGCC3CXX=	c++
_MODGCC3G77=	g77
# Always include support for this
MODGCC3_LANGS+=	${_MODGCC3CC}

.if ${MODGCC3_ARCHES:L} != ""
.  for _i in ${MODGCC3_ARCHES}
.    if !empty(MACHINE_ARCH:M${_i})
BUILD_DEPENDS+=	gcc->=3.3,<3.4|gcc->=3.3v0,<3.4v0:lang/gcc/3.3
.      for _j in ${MODGCC3_LANGS:L}
.        if !empty(_MODGCC3CC:L:M${_j})
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/eg${_MODGCC3CC} ${WRKDIR}/bin/g${_MODGCC3CC};
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/eg${_MODGCC3CC} ${WRKDIR}/bin/${_MODGCC3CC};
.        endif
.        if !empty(_MODGCC3CXX:L:M${_j})
BUILD_DEPENDS+=	g++->=3.3,<3.4|g++->=3.3v0,<3.4v0:lang/gcc/3.3,-c++
LIB_DEPENDS+=	libstdc++->=3.3,<3.4|libstdc++->=3.3v0,<3.4v0:lang/gcc/3.3,-estdc
WANTLIB +=	estdc++=6
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/e${_MODGCC3CXX} ${WRKDIR}/bin/g++;
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/e${_MODGCC3CXX} ${WRKDIR}/bin/${_MODGCC3CXX};
.        endif
.        if !empty(_MODGCC3G77:L:M${_j})
BUILD_DEPENDS+=	g77->=3.3,<3.4|g77->=3.3v0,<3.4v0:lang/gcc/3.3,-g77
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/e${_MODGCC3G77} ${WRKDIR}/bin/f77;
MODGCC3_post-patch+= ln -s ${LOCALBASE}/bin/e${_MODGCC3G77} ${WRKDIR}/bin/${_MODGCC3G77};
.	 endif
.      endfor
.    endif
.  endfor
.endif
