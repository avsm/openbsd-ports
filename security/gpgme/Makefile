# $OpenBSD: Makefile,v 1.2.2.1 2002/01/11 00:36:37 naddy Exp $

COMMENT=		"GnuPG Made Easy"

DISTNAME=		gpgme-0.2.3
CATEGORIES=     	security devel
NEED_VERSION=		1.427

HOMEPAGE=		http://www.gnupg.org/gpgme.html

MAINTAINER=		Damien Couderc <couderc.damien@wanadoo.fr>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		ftp://ftp.gnupg.org/pub/gcrypt/alpha/gpgme/

USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu

BUILD_DEPENDS=		${RUN_DEPENDS}
RUN_DEPENDS=		gpg::security/gnupg

.include <bsd.port.mk>
