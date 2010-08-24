# $OpenBSD: Makefile,v 1.10.2.1 2010/08/24 11:43:29 jasper Exp $

COMMENT=	simple login manager

DISTNAME=	slim-1.3.1
REVISION=	4

CATEGORIES=	x11
HOMEPAGE=	http://slim.berlios.de/

MAINTAINER=	Landry Breuil <gaston@gcu.info>
MASTER_SITES=	${MASTER_SITE_BERLIOS:=slim/}

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_X11=	Yes
NO_REGRESS=	Yes
LIB_DEPENDS=	::graphics/jpeg \
		::graphics/png

WANTLIB=	X11 Xft Xmu Xrender fontconfig c m stdc++ z freetype jpeg png

MAKE_FILE=	Makefile.openbsd
MAKE_FLAGS+=	CFGDIR=${SYSCONFDIR}
FAKE_FLAGS+=	PREFIX=${PREFIX} \
		CFGDIR=${PREFIX}/share/examples/slim

pre-configure:
	${SUBST_CMD} ${WRKSRC}/slim.1 ${WRKSRC}/slim.conf

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/slim
	${SUBST_CMD} -c ${FILESDIR}/README.OpenBSD \
		${PREFIX}/share/doc/slim/README.OpenBSD
	chown ${SHAREOWN}:${SHAREGRP} \
		${PREFIX}/share/doc/slim/README.OpenBSD

.include <bsd.port.mk>
