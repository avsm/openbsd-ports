# $OpenBSD: Makefile,v 1.19 2011/09/16 08:48:03 espie Exp $

COMMENT=	Objective Caml bindings for SQLite3
CATEGORIES=	databases

V=		1.5.2
DISTNAME=	release-${V}
PKGNAME=	ocaml-sqlite3-${V}
EXTRACT_SUFX=	.tar.bz2
MASTER_SITES=	http://hg.ocaml.info/release/ocaml-sqlite3/archive/
WRKDIST=	${WRKDIR}/ocaml-sqlite3-release-${V}
REVISION =	0

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://www.ocaml.info/home/ocaml_sources.html

# BSD
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS= 	Yes
CONFIGURE_STYLE=gnu
AUTOCONF_VERSION=2.59
ALL_TARGET=	docs bytecode ${MODOCAML_NATIVE:S,Yes,opt,:S,No,,}
USE_GMAKE=	Yes
NO_REGRESS=	Yes

CONFIGURE_ENV=	CFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib -L."
CONFIGURE_ARGS=	--with-sqlite3=${LOCALBASE}

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	sysutils/findlib
LIB_DEPENDS=	databases/sqlite3
WANTLIB=	sqlite3

FAKE_ENV=	OCAMLFIND_DESTDIR=${PREFIX}/lib/ocaml/site-lib/sqlite3

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/sqlite3

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ocaml-sqlite3
	for i in ${WRKBUILD}/doc/*; do ${INSTALL_DATA} $$i ${PREFIX}/share/doc/ocaml-sqlite3/; done

.include <bsd.port.mk>
