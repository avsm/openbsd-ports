# $OpenBSD: Makefile,v 1.4.2.1 2001/05/10 21:42:55 naddy Exp $

COMMENT=	"perl5 interface to GnuPG"

VERSION=	0.07
DISTNAME=	GnuPG-${VERSION}
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	security perl5
NEED_VERSION=	1.406
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR= GnuPG

RUN_DEPENDS=	${LOCALBASE}/bin/gpg:gnupg-*:security/gnupg

MAINTAINER=	Peter Galbavy <peter.galbavy@knowledge.com>

PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

CONFIGURE_STYLE= perl

.include <bsd.port.mk>	
