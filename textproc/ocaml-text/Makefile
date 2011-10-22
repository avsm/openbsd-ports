# $OpenBSD$

COMMENT=	handle Unicode text in OCaml
CATEGORIES=	textproc

V=		0.5
DISTNAME=	ocaml-text-${V}
EXTRACT_SUFX=	.tar.gz
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/641/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://forge.ocamlcore.org/projects/ocaml-text/

PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS= 	Yes

FAKE_ENV= OCAMLFIND_DESTDIR="${PREFIX}/lib/ocaml/site-lib"

do-configure:
	cd ${WRKBUILD} && ocaml setup.ml -configure --destdir ${DESTDIR}

do-build:
	cd ${WRKBUILD} && ocaml setup.ml -build

pre-install:
	mkdir -p ${PREFIX}/lib/ocaml/site-lib/text

do-install:
	cd ${WRKBUILD} && env OCAMLFIND_DESTDIR="${PREFIX}/lib/ocaml/site-lib" \
	  OCAMLFIND_LDCONF="ignore" ocaml setup.ml -install

#ALL_TARGET=	all ${MODOCAML_NATIVE:S,Yes,opt,:S,No,,}
#INSTALL_TARGET=	install ${MODOCAML_NATIVE:S,Yes,installopt,:S,No,,}
USE_GMAKE=	Yes

.include <bsd.port.mk>
