# $OpenBSD: Makefile,v 1.13.6.1 2006/01/21 18:39:37 sturm Exp $

COMMENT=		"modules for parsing (and creating!) MIME entities"

DISTNAME=		MIME-tools-5.411a
PKGNAME=		p5-${DISTNAME}p0
CATEGORIES=		mail perl5

HOMEPAGE=		http://www.zeegee.com/code/perl/MIME-tools/

MAINTAINER=		Shell Hung <shell@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=MIME/}

RUN_DEPENDS=	:p5-Mail-Tools-*:mail/p5-Mail-Tools  \
		:p5-IO-stringy->=1.211:devel/p5-IO-stringy
BUILD_DEPENDS=	${RUN_DEPENDS}

CONFIGURE_STYLE= 	perl
WRKDIST=		${WRKDIR}/${DISTNAME:S/a//}

.include <bsd.port.mk>
