# $OpenBSD$

COMMENT=	functional reactive programming for OCaml
CATEGORIES=	devel

V=		0.9.2
DISTNAME=	react-${V}
EXTRACT_SUFX=   .tbz
MASTER_SITES=	http://erratique.ch/software/react/releases/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://erratique.ch/software/react

# BSD3
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS=	Yes

ALL_TARGET=	module-byte ${MODOCAML_NATIVE:S,Yes,module-native,:S,No,,}
INSTALL_TARGET=	${MODOCAML_NATIVE:S,Yes,install,:S,No,install-byte,}
INSTALLDIR=	${PREFIX}/lib/ocaml/site-lib/react

do-build:
	cd ${WRKSRC} && sh ./build ${ALL_TARGET}

do-install:
	cd ${WRKSRC} && env INSTALLDIR=${INSTALLDIR} sh ./build ${INSTALL_TARGET} 

.include <bsd.port.mk>
