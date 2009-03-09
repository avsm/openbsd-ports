# $OpenBSD: tcl.port.mk,v 1.4 2009/03/09 23:09:19 espie Exp $

CATEGORIES +=		lang/tcl

MODTCL_VERSION ?=	8.5

.if ${MODTCL_VERSION} == 8.5
_MODTCL_SPEC = tcl->=${MODTCL_VERSION},<8.6
.endif

MODTCL_BIN ?=		${LOCALBASE}/bin/tclsh${MODTCL_VERSION}
MODTCL_INCDIR ?=	${LOCALBASE}/include/tcl${MODTCL_VERSION}
MODTCL_LIBDIR ?=	${LOCALBASE}/lib/tcl${MODTCL_VERSION}
MODTCL_CONFIG ?=	${MODTCL_LIBDIR}/tclConfig.sh

MODTCL_BUILD_DEPENDS ?=	:${_MODTCL_SPEC}:lang/tcl/${MODTCL_VERSION}
MODTCL_RUN_DEPENDS ?=	:${_MODTCL_SPEC}:lang/tcl/${MODTCL_VERSION}
MODTCL_LIB_DEPENDS ?=	tcl${MODTCL_VERSION:S/.//}:${_MODTCL_SPEC}:lang/tcl/${MODTCL_VERSION}


# Handle the two most commonly used methods
# for starting up executable Tcl scripts.
# See http://wiki.tcl.tk/812 for more information.

# Set 'tclsh' for executable scripts (in-place modification).
MODTCL_TCLSH_ADJ =	perl -pi \
			-e '$$. == 1 && s!env (tclsh|wish).*$$!env tclsh${MODTCL_VERSION}!;' \
			-e '$$. == 3 && s!exec (tclsh|wish).*$$!exec tclsh${MODTCL_VERSION} "\$$0" \$${1+"\$$@"}!;' \
			-e 'close ARGV if eof;'

# Set 'wish' for executable scripts (in-place modification).
MODTCL_WISH_ADJ =	${MODTCL_TCLSH_ADJ:S/tclsh${MODTCL_VERSION}/wish${MODTCL_VERSION}/}


SUBST_VARS +=		MODTCL_VERSION MODTCL_BIN

