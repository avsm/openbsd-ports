# $OpenBSD: Makefile,v 1.7.4.1 2006/08/26 06:17:12 sturm Exp $

COMMENT=		"rip shoutcast streams to local mp3s"

DISTNAME=		streamripper-1.0.5
PKGNAME=		${DISTNAME}p0
CATEGORIES=		audio

HOMEPAGE=		http://streamripper.sourceforge.net/

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c m pthread

MASTER_SITES=		http://streamripper.sourceforge.net/dl/

CONFIGURE_STYLE=	gnu

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/streamripper ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/streamripper
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/streamripper

NO_REGRESS=		Yes

.include <bsd.port.mk>
