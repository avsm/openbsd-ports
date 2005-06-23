# $OpenBSD: Makefile,v 1.6.2.1 2005/06/23 09:23:28 robert Exp $

COMMENT=	"anonymity service using onion routing"

DISTNAME=	tor-0.1.0.10
CATEGORIES=	net
HOMEPAGE=	http://www.freehaven.net/tor/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c crypto pthread ssl z

MASTER_SITES=	http://www.freehaven.net/tor/dist/

AUTOCONF_VERSION= 2.59

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS+=--with-ssl-dir=/usr

FAKE_FLAGS=DESTDIR=${WRKINST} sysconfdir=${PREFIX}/share/examples

.include <bsd.port.mk>
