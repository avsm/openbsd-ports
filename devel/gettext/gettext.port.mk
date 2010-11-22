# $OpenBSD: gettext.port.mk,v 1.12 2010/11/22 10:04:18 espie Exp $

_MODGETTEXT_SPEC =		devel/gettext>=0.10.38

MODGETTEXT_LIB_DEPENDS =	${_MODGETTEXT_SPEC} converters/libiconv
MODGETTEXT_WANTLIB =		intl>=5 iconv>=6

MODGETTEXT_RUN_DEPENDS =	${_MODGETTEXT_SPEC}

# The RUN_DEPENDS entry is to ensure gettext is installed. This is
# necessary so that we have locale.alias installed on static archs.
# Typically installed in PREFIX/share/locale.
LIB_DEPENDS +=		${MODGETTEXT_LIB_DEPENDS}
BUILD_DEPENDS +=	${_MODGETTEXT_SPEC}
RUN_DEPENDS +=		${MODGETTEXT_RUN_DEPENDS}
WANTLIB +=		${MODGETTEXT_WANTLIB}
