# $OpenBSD$

COMMENT=	OCaml syntax extension for type-driven codegen
CATEGORIES=	devel

V=		2.3.0
DISTNAME=	type-conv-${V}
MASTER_SITES=	http://www.janestreet.com/ocaml/

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

BUILD_DEPENDS+=	${RUN_DEPENDS}
RUN_DEPENDS+=	sysutils/findlib

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/type-conv

.include <bsd.port.mk>
