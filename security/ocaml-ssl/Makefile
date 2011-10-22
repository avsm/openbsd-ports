# $OpenBSD$

COMMENT=	OCaml bindings for SSL
CATEGORIES=	security devel

V=		0.4.3
DISTNAME=	ocaml-ssl-${V}
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=savonet/ocaml-ssl/}

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://savonet.sourceforge.net/wiki/OCamlLibs

PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS= 	Yes
CONFIGURE_STYLE=gnu
ALL_TARGET=     bcl ${MODOCAML_NATIVE:S,Yes,ncl,:S,No,,}
USE_GMAKE=	Yes

CONFIGURE_ENV=	LDFLAGS="-lutil -lcrypto"

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	sysutils/findlib
WANTLIB=        crypto ssl

do-build:
	cd ${WRKBUILD}/src && ${GMAKE} ${ALL_TARGET}

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/ssl

do-install:
	cd ${WRKBUILD}/src && ${GMAKE} OCAMLFIND_INSTFLAGS="-destdir ${PREFIX}/lib/ocaml/site-lib -ldconf ignore" install

.include <bsd.port.mk>
