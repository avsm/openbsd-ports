# $OpenBSD: qt.port.mk,v 1.2 2001/08/27 09:54:11 espie Exp $

# This fragment uses MODQT_* variables to make it easier to substitute
# qt1/qt2/qt3 in a port.
LIB_DEPENDS+=qt.1::x11/qt

MODQT_LIBDIR=	${LOCALBASE}/lib/qt
MODQT_INCDIR=	${LOCALBASE}/include/X11/qt
MODQT_MOC=	${LOCALBASE}/bin/moc
MODQT_CONFIGURE_ARGS=	--with-qt-includes=${MODQT_INCDIR} \
			--with-qt-libraries=${MODQT_LIBDIR}
_MODQT_SETUP=	MOC=${MODQT_MOC} \
		MODQT_INCDIR=${MODQT_INCDIR} \
		MODQT_LIBDIR=${MODQT_LIBDIR}

CONFIGURE_ENV+=	${_MODQT_SETUP}
MAKE_ENV+=	${_MODQT_SETUP}
MAKE_FLAGS+=	${_MODQT_SETUP}
