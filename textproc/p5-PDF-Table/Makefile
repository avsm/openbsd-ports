# $OpenBSD: Makefile,v 1.4 2010/12/03 11:46:48 ajacoutot Exp $

COMMENT=		create PDF tables with perl

DISTNAME=		PDF-Table-0.9.3
REVISION=		0

CATEGORIES=		textproc

MAINTAINER=		Alexander Bluhm <bluhm@openbsd.org>

# Perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=		cpan
USE_GROFF =		Yes
RUN_DEPENDS=		textproc/p5-PDF-API2

.include <bsd.port.mk>
