# $OpenBSD: Makefile,v 1.8 2010/11/15 19:46:00 espie Exp $

COMMENT=	framework for creating extensible applications

DISTNAME=	mono-addins-0.5
CATEGORIES=	devel lang

HOMEPAGE=	http://www.mono-project.com/Mono.Addins

# MIT X11, MPL
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MASTER_SITES=	http://www.go-mono.com/sources/mono-addins/
EXTRACT_SUFX=	.tar.bz2

USE_GMAKE=	Yes
USE_GROFF =	Yes

MODULES=	lang/mono
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	x11/mono-gtk2

CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
