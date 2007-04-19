# $OpenBSD: Makefile,v 1.10.4.1 2007/04/19 14:26:56 sturm Exp $

COMMENT=	"GNU copy-in/out (cpio)"

DISTNAME=	cpio-2.7
PKGNAME=	g${DISTNAME}
CATEGORIES=	archivers

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_GNU:=cpio/}

MODULES=	gettext
WANTLIB=	c

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt

.include <bsd.port.mk>
