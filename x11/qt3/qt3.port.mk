# $OpenBSD: qt3.port.mk,v 1.13 2010/11/05 10:06:44 espie Exp $

# This fragment defines MODQT_* variables to make it easier to substitute
# qt1/qt2/qt3 in a port.

MODQT_OVERRIDE_UIC ?= Yes
MODQT3_OVERRIDE_UIC ?= ${MODQT_OVERRIDE_UIC}

MODQT3_LIBDIR =	${LOCALBASE}/lib/qt3
MODQT_LIBDIR ?= ${MODQT3_LIBDIR}
MODQT3_INCDIR =	${LOCALBASE}/include/X11/qt3
MODQT_INCDIR ?= ${MODQT3_INCDIR}
MODQT3_CONFIGURE_ARGS =	--with-qt-includes=${MODQT3_INCDIR} \
			--with-qt-libraries=${MODQT3_LIBDIR}
MODQT_CONFIGURE_ARGS ?= ${MODQT3_CONFIGURE_ARGS}
_MODQT3_SETUP =	MOC=${MODQT3_MOC} \
		MODQT_INCDIR=${MODQT3_INCDIR} \
		MODQT_LIBDIR=${MODQT3_LIBDIR}
.if ${MODQT3_OVERRIDE_UIC:L} == "yes"
_MODQT3_SETUP +=	UIC=${MODQT3_UIC}
.endif
_MODQT_SETUP ?= ${MODQT3_SETUP}

MODQT3_LIB_DEPENDS = ::x11/qt3
MODQT_LIB_DEPENDS ?= ${MODQT3_LIB_DEPENDS}
MODQT3_WANTLIB = lib/qt3/qt-mt.>=3
MODQT_WANTLIB ?= ${MODQT3_WANTLIB}
LIB_DEPENDS +=	${MODQT3_LIB_DEPENDS}
WANTLIB += ${MODQT3_WANTLIB}

# may be needed to find plugins
MODQT3_MOC =	${LOCALBASE}/bin/moc3-mt
MODQT_MOC ?=	${MODQT3_MOC}
MODQT3_UIC =	${LOCALBASE}/bin/uic3-mt
MODQT_UIC ?=	${MODQT3_UIC}
MODQT3_QTDIR =	${LOCALBASE}/lib/qt3
MODQT_QTDIR ?=	${MODQT3_QTDIR}
MODQT3_PLUGINS =lib/qt3/plugins-33
MODQT_PLUGINS ?=${MODQT3_PLUGINS}

CONFIGURE_ENV += ${_MODQT3_SETUP}
MAKE_ENV +=   ${_MODQT3_SETUP}
MAKE_FLAGS += ${_MODQT3_SETUP}
