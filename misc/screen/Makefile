# $OpenBSD: Makefile,v 1.19.2.1 2000/07/03 19:02:47 turan Exp $

DISTNAME=	screen-3.9.5
PKGNAME=	screen-3.9.5p1
CATEGORIES=	misc
NEED_VERSION=	1.218
MASTER_SITES=	ftp://ftp.uni-erlangen.de/pub/utilities/screen/ \
		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR= screen

MAINTAINER=	brad@openbsd.org

LICENSE_TYPE=		GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

HAS_CONFIGURE=	Yes
CONFIGURE_ARGS=	--prefix='$${DESTDIR}${PREFIX}' --sysconfdir='$${DESTDIR}/etc'
FAKE=		Yes

post-install:
	@rm -f ${PREFIX}/bin/screen
	@cd ${PREFIX}/bin; ln -sf screen-3.9.5 screen
	${INSTALL_DATA_DIR} ${PREFIX}/lib/screen
	${INSTALL_DATA} ${WRKSRC}/etc/etcscreenrc ${PREFIX}/lib/screen/screenrc
	${INSTALL_DATA} ${WRKSRC}/terminfo/screencap ${PREFIX}/lib/screen

.include <bsd.port.mk>
