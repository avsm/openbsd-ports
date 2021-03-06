# $OpenBSD: Makefile.inc,v 1.12 2010/12/05 18:24:33 jasper Exp $

# Check individual packages for overrides when bumping this!
PKGNAME?=	${DISTNAME:C/-([0-9])$/_\1/}
REVISION?=	1

DIST_SUBDIR?=	aspell

EXTRACT_SUFX?=	.tar.bz2

HOMEPAGE?=	http://aspell.sourceforge.net/

# GPLv2 - LGPLv2 - FDL - CC ShareAlike
PERMIT_DISTFILES_CDROM?=Yes
PERMIT_DISTFILES_FTP?=	Yes
PERMIT_PACKAGE_CDROM?=	Yes
PERMIT_PACKAGE_FTP?=	Yes

NO_REGRESS?=	Yes

CONFIGURE_STYLE?=simple

RUN_DEPENDS?=	textproc/aspell/core
BUILD_DEPENDS?=	${RUN_DEPENDS}
