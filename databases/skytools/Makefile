# $OpenBSD: Makefile,v 1.15 2011/09/16 08:48:05 espie Exp $

COMMENT=	PostgreSQL tools from Skype

MODPY_EGG_VERSION=	2.1.12
DISTNAME=		skytools-${MODPY_EGG_VERSION}
REVISION =		1

CATEGORIES=	databases

HOMEPAGE=	http://pgfoundry.org/projects/skytools

MAINTAINER=	Pierre-Emmanuel Andre <pea@openbsd.org>

# BSD
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

WANTLIB= 	c

MASTER_SITES=	http://pgfoundry.org/frs/download.php/2872/

MODULES=	lang/python

BUILD_DEPENDS=	databases/postgresql,-server 

RUN_DEPENDS=    databases/py-psycopg2

NO_REGRESS=	Yes
USE_GMAKE=	Yes
USE_GROFF =	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-python=${MODPY_BIN} 

BINFILES=	bulk_loader.py cube_dispatcher.py londiste.py \
		pgqadm.py queue_mover.py queue_splitter.py \
		scriptmgr.py skytools_upgrade.py table_dispatcher.py \
		walmgr.py

pre-configure:
	${SUBST_CMD} ${WRKSRC}/doc/Makefile
	@find ${WRKSRC} -name '*.py' \
		-exec perl -pi -e 's,/usr/bin/env python,${MODPY_BIN},' {} \; 
	@perl -pi -e 's,share/doc,share/examples,' ${WRKSRC}/setup.py

post-install:
.for i in ${BINFILES}
	@cd ${PREFIX}/bin && mv ${i} `basename ${i} .py`
.endfor

.include <bsd.port.mk>
