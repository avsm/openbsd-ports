# $OpenBSD: Makefile,v 1.15 2010/11/16 11:23:27 espie Exp $

COMMENT=	city-building simulation

DISTNAME=	micropolis-20080211
REVISION=	3
WRKDIST=	${WRKDIR}/micropolis

CATEGORIES=	games

HOMEPAGE=	http://www.donhopkins.com/home/micropolis/
MASTER_SITES=	http://freedaemon.com/~deanna/

# GPLv3
# beware of SimCity, tm of Electronic Arts
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

NO_REGRESS=	Yes
RUN_DEPENDS=	devel/desktop-file-utils
WANTLIB=	X11 Xext Xpm c m pthread pthread-stubs xcb SDL SDL_mixer
LIB_DEPENDS=	devel/sdl \
		devel/sdl-mixer

CFLAGS+=	-I${LOCALBASE}/include -I${X11BASE}/include

do-configure:
	@perl -pi -e s,%%PREFIX%%,${PREFIX}, ${WRKDIST}/Micropolis
	@perl -pi -e s,%%PREFIX%%,${PREFIX}, ${WRKDIST}/res/micropolis.tcl
	@perl -pi -e s,%%LOCALBASE%%,${LOCALBASE}, ${WRKDIST}/res/micropolis.tcl
	@perl -pi -e s,%%X11BASE%%,${X11BASE},g ${WRKSRC}/src/tclx/config.mk
	@perl -pi -e s,%%X11BASE%%,${X11BASE},g ${WRKSRC}/src/tk/makefile

.include <bsd.port.mk>
