# $OpenBSD$

COMMENT=	OCaml library to generate binary protocols
CATEGORIES=	net

V=		2.0.3
DISTNAME=	bin-prot-${V}
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
RUN_DEPENDS+=	sysutils/findlib devel/type-conv

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/bin-prot

.include <bsd.port.mk>
