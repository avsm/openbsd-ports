# $OpenBSD: Makefile,v 1.14 2010/12/03 11:45:38 ajacoutot Exp $

COMMENT=	interface to read EXIF tags in JPEG images

SHARED_ONLY=	Yes

DISTNAME=	Image-EXIF-0.98.6
REVISION=	2
CATEGORIES=	graphics

MAINTAINER=	Dan Weeks <danimal@danimal.org>
MODULES=	cpan
USE_GROFF =	Yes

# BSD
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

EXTRACT_SUFX=	.tgz

LIB_DEPENDS=	graphics/libexif
WANTLIB =	exif>=8

pre-configure:
	@perl -i -p -e 's#/usr/local#${LOCALBASE}#' ${WRKDIST}/Makefile.PL

.include <bsd.port.mk>
