# $OpenBSD: Makefile,v 1.22 2011/09/16 10:02:36 espie Exp $

COMMENT=	gtk2 comic book viewer

DISTNAME=	comix-4.0.3
REVISION=	6

CATEGORIES=	graphics

MAINTAINER=	Mathieu Sauve-Frankel <msf@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=comix/}

MODULES=	lang/python \
		devel/gconf2
PY_FLAVOR=	python${MODPY_VERSION}

MODGCONF2_LIBDEP= No
MODGCONF2_SCHEMAS_DIR= comix

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	py-Imaging-*-${PY_FLAVOR}:graphics/py-Imaging,${PY_FLAVOR} \
		x11/py-gtk2 \
		misc/shared-mime-info \
		devel/desktop-file-utils

USE_GROFF =	Yes
NO_REGRESS=	Yes

post-extract:
		${GUNZIP_CMD} ${WRKSRC}/comix.1.gz ${WRKSRC}/mime/comicthumb.1.gz

do-build:
		${SUBST_CMD} -c ${WRKSRC}/src/comix.py ${WRKSRC}/comix

do-install:
		cd ${WRKSRC} && ${MODPY_BIN} install.py --dir ${PREFIX} install
		# schemas files are always installed under LOCALBASE, not PREFIX
		${INSTALL_DATA_DIR} ${WRKINST}/${LOCALBASE}/${SCHEMAS_INSTDIR}/
		${INSTALL_DATA} ${WRKSRC}/mime/comicbook.schemas \
			${WRKINST}/${LOCALBASE}/${SCHEMAS_INSTDIR}/

PKG_ARCH=	*

.include <bsd.port.mk>
