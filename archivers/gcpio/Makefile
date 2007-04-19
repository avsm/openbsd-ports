# $OpenBSD: Makefile,v 1.10.2.1 2007/04/19 13:47:06 sturm Exp $

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
		--infodir='${PREFIX}/info' \
		--mandir='${PREFIX}/man' \
		--with-rmt=/etc/rmt

.include <bsd.port.mk>
