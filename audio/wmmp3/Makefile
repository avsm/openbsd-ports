# $OpenBSD: Makefile,v 1.19 2010/11/15 00:22:49 espie Exp $

COMMENT=		wm-dockapp; front end for an mp3 player

DISTNAME=		wmmp3-0.12
REVISION=		2
CATEGORIES=		audio x11 x11/windowmaker

HOMEPAGE=		http://www.dotfiles.com/software/wmmp3/

MAINTAINER=		Peter Stromberg <wilfried@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		X11 Xext Xpm c

MASTER_SITES=		${HOMEPAGE}

RUN_DEPENDS=		audio/madplay

SEPARATE_BUILD=		concurrent
NO_REGRESS=		Yes
CONFIGURE_STYLE=	gnu

SAMPLE_DIR=		${PREFIX}/share/examples/wmmp3
SUBST_VARS+=		SAMPLE_DIR

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/wmmp3 ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${SAMPLE_DIR}
	${INSTALL_DATA} ${WRKSRC}/sample.wmmp3 ${SAMPLE_DIR}/dot.wmmp3.sample

.include <bsd.port.mk>
