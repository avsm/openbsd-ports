# $OpenBSD: Makefile,v 1.12 2011/10/01 08:30:37 jasper Exp $

COMMENT =	highly reliable Enterprise Messaging System

V =		2.6.1
DISTNAME =	rabbitmq-server-$V
PKGNAME =	rabbitmq-$V
CATEGORIES =	net

HOMEPAGE =	http://www.rabbitmq.com/

MAINTAINER =	Piotr Sikora <piotr.sikora@frickle.com>

# MPL
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

MASTER_SITES =	http://www.rabbitmq.com/releases/rabbitmq-server/v${V}/

MODULES =	lang/python
MODPY_RUNDEPS =	No

USE_GMAKE =	Yes
USE_GROFF =	Yes

CONFIGURE_STYLE = none

BUILD_DEPENDS =	${RUN_DEPENDS} \
		${MODPY_JSON} \
		textproc/libxslt \
		textproc/xmlto

RUN_DEPENDS =	lang/erlang

MAKE_ENV =	PYTHON=${MODPY_BIN}

RABBITUSER =	_rabbitmq

SUBST_VARS +=	RABBITUSER

pre-build:
	${SUBST_CMD} ${WRKSRC}/scripts/rabbitmqctl

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/rabbitmq
	@for file in INSTALL LICENSE LICENSE-MPL-RabbitMQ ; do \
		mv ${PREFIX}/lib/rabbitmq/$$file \
			${PREFIX}/share/doc/rabbitmq; \
	done
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/rabbitmq
	${INSTALL_DATA} ${FILESDIR}/rabbitmq.conf \
		${PREFIX}/share/examples/rabbitmq/rabbitmq-env.conf

.include <bsd.port.mk>
