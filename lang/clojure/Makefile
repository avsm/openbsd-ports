# $OpenBSD: Makefile,v 1.12 2011/10/21 16:23:45 espie Exp $

COMMENT =		Lisp-1 dialect for the Java Virtual Machine

V =			1.3.0
DISTNAME =		clojure-${V}
EXTRACT_SUFX =		.zip
PKG_ARCH =		*

CATEGORIES =		lang

HOMEPAGE =		http://www.clojure.org/

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# Eclipse Public License EPL 1.0
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =		http://repo1.maven.org/maven2/org/clojure/clojure/$V/

MODULES =		java
MODJAVA_VER =		1.6+
MODJAVA_BUILD = 	ant
MODJAVA_BUILD_TARGET =	jar
MODJAVA_JRERUN = 	Yes

RUN_DEPENDS =		java/javaPathHelper \
			misc/rlwrap

# Tests fail to compile (and need JAX-WS)
NO_REGRESS =		Yes

CLOJURE_HOME =		${PREFIX}/clojure

do-install:
	${INSTALL_DATA_DIR} ${CLOJURE_HOME}
	${INSTALL_DATA} ${WRKSRC}/clojure.jar ${CLOJURE_HOME}
	@${SUBST_CMD} -o ${BINOWN} -g ${BINGRP} -c \
		${FILESDIR}/clojure \
		${PREFIX}/bin/clojure
	cd ${WRKDIST} && tar -cf - src | tar -C ${CLOJURE_HOME} -xf -
	chown -R ${SHAREOWN}:${SHAREGRP} ${CLOJURE_HOME}/src

.include <bsd.port.mk>
