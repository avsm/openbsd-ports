# $OpenBSD: Makefile,v 1.18 2011/09/20 20:51:52 jasper Exp $

COMMENT=	graphical diff and merge tool

GNOME_VERSION=	1.5.2
GNOME_PROJECT=	meld
REVISION=	1

CATEGORIES=	textproc x11

HOMEPAGE=	http://meld.sourceforge.net/

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

MODULES=	lang/python \
		textproc/intltool \
		x11/gnome

RUN_DEPENDS=	x11/py-gtk2

MODGNOME_TOOLS= 	yelp
MODGNOME_DESKTOP_FILE=	Yes

SUBST_VARS+=	MODPY_SITEPKG
CONFIGURE_STYLE=none
NO_REGRESS=	yes
MAKE_ENV=	PYTHON=${MODPY_BIN}

MODPY_ADJ_FILES=bin/meld

pre-configure:
	${SUBST_CMD} ${WRKSRC}/INSTALL

.include <bsd.port.mk>
