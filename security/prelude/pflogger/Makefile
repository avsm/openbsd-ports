# $OpenBSD: Makefile,v 1.14 2011/09/21 17:20:56 jasper Exp $

COMMENT=	Prelude sensors for Packet Filter

DISTNAME=	prelude-pflogger-0.9.0-rc2
PKGNAME=	prelude-pflogger-0.9.0rc2

REVISION=	9

MASTER_SITES=	http://www.prelude-ids.com/download/releases/prelude-pflogger/

MODULES=	devel/gettext
WANTLIB=	c gcrypt gnutls gpg-error pcap pthread tasn1 z prelude

LIB_DEPENDS=	security/prelude/libprelude

CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
