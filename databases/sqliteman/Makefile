# $OpenBSD: Makefile,v 1.14 2011/09/16 08:48:05 espie Exp $

COMMENT =	gui for sqlite
CATEGORIES =	databases x11

DISTNAME =	sqliteman-1.2.0
REVISION =	2

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=sqliteman/}
HOMEPAGE =	http://sourceforge.net/projects/sqliteman/

# GPL
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes

WANTLIB =	ICE SM X11 Xext Xi Xinerama Xrandr Xrender \
		c fontconfig freetype m pthread stdc++ z png glib-2.0 \
		gthread-2.0 pthread-stubs xcb

MODULES =		devel/cmake
CONFIGURE_STYLE =	cmake
SEPARATE_BUILD =	simple

LIB_DEPENDS =	x11/qt4 \
		editors/qscintilla
WANTLIB +=	QtCore QtGui QtSql QtXml qscintilla2

RUN_DEPENDS =	x11/qt4,-sqlite \
		devel/desktop-file-utils


NO_REGRESS =	Yes

.include <bsd.port.mk>
