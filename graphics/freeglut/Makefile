# $OpenBSD: Makefile,v 1.4 2010/10/24 21:21:00 ajacoutot Exp $

COMMENT =		open source alternative to glut
DISTNAME =		freeglut-2.6.0
SHARED_LIBS =		glut 4.1
CATEGORIES =		graphics
HOMEPAGE =		http://freeglut.sourceforge.net/
MAINTAINER =		Tobias Ulmer <tobiasu@tmux.org>

# X11
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		GL X11 Xau Xdmcp Xext Xi Xxf86vm m pthread-stubs xcb

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=freeglut/}

USE_LIBTOOL =		Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	${CONFIGURE_SHARED} \
			--enable-warnings=no

NO_REGRESS =		Yes

.include <bsd.port.mk>
