# $OpenBSD$

COMMENT=	Extended standard library for OCaml
CATEGORIES=	devel

V=		107.01
DISTNAME=	core-${V}
PKGNAME=	ocaml-core-${V}
MASTER_SITES=	http://www.janestreet.com/ocaml/
WRKDIST=	${WRKDIR}/core-${V}

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://ocaml.janestreet.com/?q=node/13

# LGPL+linking exception
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS= 	Yes
CONFIGURE_STYLE=simple
USE_GMAKE=	Yes
NO_REGRESS=	Yes

MAKE_ENV=	OCAMLFIND_COMMANDS="ocamldoc=ocamldoc.opt"

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	sysutils/findlib

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/core

.include <bsd.port.mk>
