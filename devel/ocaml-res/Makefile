# $OpenBSD$

COMMENT=	resizing contiguous memory in OCaml
CATEGORIES=	devel

V=		3.2.0
DISTNAME=	release-${V}
PKGNAME=	ocaml-res-${V}
EXTRACT_SUFX=	.tar.bz2
MASTER_SITES=	http://hg.ocaml.info/release/res/archive/
WRKDIST=	${WRKDIR}/res-release-${V}

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://www.ocaml.info/home/ocaml_sources.html

# BSD
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
NO_REGRESS= 	Yes
ALL_TARGET=	all # TODO: bc only
USE_GMAKE=	Yes
NO_REGRESS=	Yes

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS+=	sysutils/findlib

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/res

.include <bsd.port.mk>
