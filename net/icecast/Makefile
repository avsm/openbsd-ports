# $OpenBSD: Makefile,v 1.8.2.1 2001/03/22 15:24:30 naddy Exp $

.if ${MACHINE_ARCH} == "sparc"
BROKEN=		"pthreads are currently not working on the SPARC architecture"
.endif

DISTNAME=	icecast-1.3.10
CATEGORIES=	net audio www
NEED_VERSION=	1.340
MASTER_SITES=	http://www.icecast.org/releases/

HOMEPAGE=	http://www.icecast.org/

MAINTAINER=	Federico Schwindt <fgsch@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

SYSCONFDIR=	/etc/icecast
CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-crypt --with-libwrap

DOCS=	AUTHORS BUGS CHANGES COPYING FAQ README

post-install:
	cd ${WRKSRC}; ${INSTALL_DATA} ${DOCS} ${PREFIX}/share/doc/icecast

.include <bsd.port.mk>
