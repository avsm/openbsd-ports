# $OpenBSD: Makefile,v 1.10.2.1 2005/10/27 20:06:09 sturm Exp $

COMMENT=	"advanced revision control system written in Haskell"

V=		1.0.2
DISTNAME=	darcs-${V}
PKGNAME=	${DISTNAME}p0
CATEGORIES=	devel

HOMEPAGE=	http://www.darcs.net/
MASTER_SITES=	${HOMEPAGE}

MAINTAINER=	Don Stewart <dons@openbsd.org>

MODULES=	lang/ghc
LIB_DEPENDS=	curl.2::net/curl

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--datadir=${PREFIX}/share --libexecdir=${PREFIX}/libexec
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib" \
		CFLAGS=""

USE_GMAKE=	Yes
MAKE_FILE=	GNUmakefile
INSTALL_TARGET= install installserver installdocs
MAKE_ENV+= 	DARCS=${WRKSRC}/darcs

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c crypto curses gmp m ncurses pthread readline ssl z

.include <bsd.port.mk>
