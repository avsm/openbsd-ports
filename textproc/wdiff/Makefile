# OpenBSD makefile for:	wdiff
# Version required:	0.5
# Date created:		May 16 1998
# Whom:			Angelos D. Keromytis
#
# $OpenBSD: Makefile,v 1.7.2.1 2000/09/15 05:20:18 marc Exp $
#

DISTNAME=	wdiff-0.5
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR= wdiff

MAINTAINER=	angelos@openbsd.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MAN1=		wdiff.1
HAS_CONFIGURE=Yes
CONFIGURE_ARGS=--prefix='$${DESTDIR}${PREFIX}'

.include <bsd.port.mk>
