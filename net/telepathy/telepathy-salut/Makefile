# $OpenBSD: Makefile,v 1.25 2011/09/16 11:13:41 espie Exp $

COMMENT=		flexible communications framework, local-link component

DISTNAME=		telepathy-salut-0.4.0
REVISION=		1

MASTER_SITES=		${MASTER_SITES_TP:=telepathy-salut/}

WANTLIB += c dbus-1 dbus-glib-1 gcrypt gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gnutls gobject-2.0 gpg-error gthread-2.0
WANTLIB += m pcre pthread tasn1 xml2 z soup-2.4>=1 telepathy-glib
WANTLIB += avahi-client avahi-common avahi-glib avahi-gobject

MODULES=		devel/gettext \
			lang/python

BUILD_DEPENDS=		textproc/libxslt \
			devel/check
LIB_DEPENDS=		net/avahi \
			devel/libsoup \
			net/telepathy/telepathy-glib

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			ac_cv_prog_PYTHON="${MODPY_BIN}"
CONFIGURE_ARGS=		${CONFIGURE_SHARED}

REGRESS_DEPENDS=	textproc/py-xmldiff

.include <bsd.port.mk>
