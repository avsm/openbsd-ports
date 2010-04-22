# $OpenBSD: Makefile,v 1.5.8.1 2010/04/22 03:00:38 william Exp $

COMMENT=	abstraction of various SASL mechanism responses

V=		1.0.1
DISTNAME=	Auth_SASL-${V}
PKGNAME=	pear-Auth-SASL-${V}p2
CATEGORIES=	security pear

MASTER_SITES=	http://pear.php.net/get/
EXTRACT_SUFX=	.tgz

MODULES=	www/pear

# PHP License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

# Bug #14671:  Security issue due to seeding random number generator
post-extract:
	cd ${WRKSRC}/SASL \
		&& cp DigestMD5.php DigestMD5.php.orig \
		&& sed '/mt_srand/d' DigestMD5.php.orig > DigestMD5.php

.include <bsd.port.mk>
