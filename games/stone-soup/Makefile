# $OpenBSD: Makefile,v 1.4 2011/09/16 09:48:10 espie Exp $

COMMENT = 	dungeon crawl stone soup
CATEGORIES = 	games

HOMEPAGE = 	http://crawl.develz.org/
MASTER_SITES = 	${MASTER_SITE_SOURCEFORGE:=crawl-ref/}
VERSION = 	0.7.2
DISTNAME=	stone_soup-${VERSION}-nodeps
EXTRACT_SUFX=	.tar.bz2
PKGNAME=	stone-soup-${VERSION}
REVISION=	1

BROKEN-arm=	tilegen.elf loops burning cpu

WRKDIST = 	${WRKDIR}/stone_soup-${VERSION}
WRKSRC = 	${WRKDIST}/source
MAKE_FILE = 	${WRKSRC}/makefile
USE_GMAKE = 	Yes
MAKE_FLAGS = 	LUA_INCLUDE_DIR=${LOCALBASE}/include \
		LUA_LIB=-llua \
		SQLITE_INCLUDE_DIR=${LOCALBASE}/include \
		LDFLAGS=-L${LOCALBASE}/lib \
		INSTALL_UGRP=root:wheel \
		prefix=${PREFIX} \
		SAVEDIR="~/.crawl" \
		V=1

MODULES = 	lang/lua
WANTLIB = 	c m stdc++ lua sqlite3

LIB_DEPENDS = 	databases/sqlite3

# Almost nethack...
PERMIT_DISTFILES_FTP = 	Yes
PERMIT_PACKAGE_FTP = 	Yes
PERMIT_DISTFILES_CDROM = No gain
PERMIT_PACKAGE_CDROM = 	No gain

FLAVORS = 	no_x11
FLAVOR ?=

.if ${FLAVOR:L:Mno_x11}
WANTLIB +=	ncursesw
MAKE_FLAGS += 	USE_UNICODE=y UNICODE_LOCALE=y
.else
MAKE_FLAGS += 	TILES=y \
		LDFLAGS="-L${LOCALBASE}/lib -lSDL -lSDL_image -lpng -pthread"
WANTLIB += 	GL GLU SDL SDL_image freetype png pthread z
LIB_DEPENDS += 	devel/sdl \
		devel/sdl-image \
		print/freetype \
		graphics/png
.endif

post-install:
	mv ${PREFIX}/bin/crawl ${PREFIX}/bin/crawl-ss
	chmod 755 ${PREFIX}/bin/crawl-ss
	${INSTALL_MAN} ${WRKDIST}/docs/crawl.6 ${PREFIX}/man/man6/crawl-ss.6
	${INSTALL_DATA} ${WRKDIST}/README.txt ${PREFIX}/share/crawl/docs

NO_REGRESS=Yes

.include <bsd.port.mk>
