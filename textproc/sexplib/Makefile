# $OpenBSD$

COMMENT=	OCaml library to manipulate S-expressions
CATEGORIES=	textproc

V=		7.0.2
DISTNAME=	sexplib-${V}
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
CONFIGURE_ARGS=	--destdir ${DESTDIR}
USE_GMAKE=	Yes
NO_REGRESS=	Yes

BUILD_DEPENDS+=	${RUN_DEPENDS}
RUN_DEPENDS+=	sysutils/findlib devel/type-conv

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/sexplib

.include <bsd.port.mk>
