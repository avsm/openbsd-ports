# $OpenBSD: Makefile,v 1.3.2.1 2000/09/15 05:18:26 marc Exp $

DISTNAME=       webmin-0.80
CATEGORIES=     sysutils
NEED_VERSION=	1.310
FAKE=No
MASTER_SITES=   http://www.webmin.com/webmin/download/

MAINTAINER=     kevlo@openbsd.org

PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

NO_BUILD=       Yes
IS_INTERACTIVE= Yes
NO_PACKAGE=     "interactive port"

do-install:
	sh ${WRKSRC}/setup.sh

.include <bsd.port.mk>
