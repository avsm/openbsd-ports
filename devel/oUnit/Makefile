# $OpenBSD$

COMMENT=	Objective Caml unit testing library
CATEGORIES=	devel

V=		1.1.0
DISTNAME=	ounit-${V}
PKGNAME=	oUnit-${V}
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/495/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://ounit.forge.ocamlcore.org/

PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
REGRESS_TARGET=	test
ALL_TARGET=	all
CONFIGURE_STYLE=simple
CONFIGURE_ARGS=	--destdir ${DESTDIR}
USE_GMAKE=	yes

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS+=	sysutils/findlib

post-patch:
	chmod a+x ${WRKBUILD}/configure

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/oUnit

.include <bsd.port.mk>
