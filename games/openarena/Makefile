# $OpenBSD: Makefile,v 1.12 2011/07/15 07:33:16 jasper Exp $

ONLY_FOR_ARCHS =	amd64 i386 macppc

COMMENT-main =		OpenArena client
COMMENT-server =	OpenArena server
COMMENT-data =		OpenArena data for client/server

MULTI_PACKAGES =	-main -server -data

CATEGORIES =		games x11

V =			0.8.5
E_V =			0.8.1	# engine version

PKGNAME =		openarena-${V}
PKGNAME-main =		openarena-${V}
PKGNAME-server =	openarena-server-${V}
PKGNAME-data =		openarena-data-${V}

PKG_ARCH-data = 	*
REVISION-data=		0

DISTNAME =		oa${V:S/.//g}
DISTFILES =		${DISTNAME}.zip openarena-engine-${E_V}-1.tar.bz2

MS_PREFIX =		http://download.tuxfamily.org/openarena/rel/
HOMEPAGE =		http://www.openarena.ws/
MASTER_SITES =		${MS_PREFIX}/${V:S/.//g}/ \
			${MS_PREFIX}/${E_V:S/.//g}/source/ \
			http://openbsd.fi/distfiles/

# GPLv2 but contains software with other (free) licenses as well
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB-main =		GL c m pthread sndio ogg>=5 SDL>=7 vorbis>=7 \
			vorbisfile>=5
WANTLIB-server =	c m

LIB_DEPENDS-main =	audio/libogg \
			devel/sdl \
			audio/libvorbis
RUN_DEPENDS-main =	${BASE_PKGPATH},-data
RUN_DEPENDS-server =	${BASE_PKGPATH},-data

ALL_TARGET =		release
USE_GMAKE =		Yes
MAKE_FLAGS =		USE_OPENAL=0 \
			BINEXT='' \
			DEFAULT_BASEDIR=${LOCALBASE}/share/openarena

WRKDIST =		${WRKDIR}/openarena-engine-${E_V}

post-extract:
	find ${WRKDIR} -name '*.orig' -print0 | xargs -0r rm -f
	mkdir ${WRKSRC}/code/sndio
	cp ${FILESDIR}/snd_sndio.c ${WRKSRC}/code/sndio

do-install:
	${INSTALL_PROGRAM} \
		${WRKDIST}/build/release-openbsd/openarena-* \
		${PREFIX}/bin/
	${INSTALL_DATA_DIR} ${PREFIX}/share/openarena/baseoa
	${INSTALL_DATA_DIR} ${PREFIX}/share/openarena/missionpack
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/openarena
	${INSTALL_DATA} \
		${WRKDIR}/openarena-${E_V}/README \
		${WRKDIR}/openarena-${E_V}/COPYING \
		${WRKDIR}/openarena-${E_V}/CHANGES \
		${PREFIX}/share/doc/openarena/
	${INSTALL_DATA} ${WRKDIR}/openarena-${E_V}/baseoa/* \
		${PREFIX}/share/openarena/baseoa/
	${INSTALL_DATA} ${WRKDIR}/openarena-${E_V}/missionpack/* \
		${PREFIX}/share/openarena/missionpack/


.include <bsd.port.mk>
