# $OpenBSD: Makefile,v 1.13.2.1 2000/09/15 05:02:13 marc Exp $

DISTNAME=	xfaces-3.3
CATEGORIES=	mail
NEED_VERSION=	 1.230

# xfaces-sounds.tar.gz only in LOCAL_PORTS
MASTER_SITES=	ftp://ftp.cs.indiana.edu/pub/faces/xfaces/ \
		ftp://odie.physik2.uni-rostock.de/pub/ \
		${MASTER_SITE_LOCAL}
DISTFILES=	${DISTNAME}.tar.Z xfaces-sounds.tar.gz

MAINTAINER=	ports@openbsd.org

LICENSE_TYPE=		"BSD NO"
PERMIT_PACKAGE_CDROM=	No
PERMIT_PACKAGE_FTP=	No
PERMIT_DISTFILES_CDROM=	No
PERMIT_DISTFILES_FTP=	No

LIB_DEPENDS=	compface::mail/faces

USE_IMAKE=	Yes

post-extract:
	@ln -sf ../sounds ${WRKSRC}

pre-install:
	@${INSTALL_DATA_DIR} ${PREFIX}/share/sounds
	@${INSTALL_DATA_DIR} ${PREFIX}/include/X11/pixmaps

.include <bsd.port.mk>
