# $OpenBSD: gettext.port.mk,v 1.6 2001/10/28 19:17:06 brad Exp $

# This dependency entry is to ensure libiconv is installed when using
# the gettext module. This is necessary incase another program uses
# the libintl libtool wrapper for linking.
BUILD_DEPENDS+=	:libiconv-*:converters/libiconv
# The RUN_DEPENDS entry is to ensure gettext is installed. This is
# necessary so that we have locale.alias installed on static archs.
# Typically installed in PREFIX/share/locale.
LIB_DEPENDS+=	intl.1:gettext->=0.10.38:devel/gettext
BUILD_DEPENDS+=	:gettext->=0.10.38:devel/gettext
RUN_DEPENDS+=	:gettext->=0.10.38:devel/gettext
