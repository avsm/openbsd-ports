# $OpenBSD: Makefile,v 1.37 2011/09/16 10:02:36 espie Exp $

COMMENT =	3D creation software

DISTNAME =	blender-2.49b
REVISION =	5

CATEGORIES =	graphics

HOMEPAGE =	http://www.blender.org/

# GPL
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MASTER_SITES =	http://download.blender.org/source/ \
		http://mirror.cs.umn.edu/blender.org/source/ \
		http://public.planetmirror.com/pub/blender/source/

MODULES =	devel/scons lang/python

RUN_DEPENDS =	graphics/tiff
BUILD_DEPENDS =	graphics/tiff
LIB_DEPENDS =	graphics/png \
		graphics/jpeg \
		graphics/glew \
		devel/sdl \
		${MODPY_LIB_DEPENDS}

WANTLIB =	GL GLU X11 Xi c m pthread stdc++ util z
WANTLIB += 	${MODPY_WANTLIB}
WANTLIB +=	png jpeg GLEW SDL

SEPARATE_BUILD = simple
NO_REGRESS =	Yes

CFLAGS +=	-fPIC -funsigned-char -fno-strict-aliasing

post-extract:
	@cd ${WRKSRC}/config && cp openbsd3-config.py openbsd-config.py

ALL_TARGET =	blendernogame

MODSCONS_ENV =	CC=${CC} CXX=${CXX} C_WARN="-Wall" \
		CFLAGS="${CFLAGS}" CCFLAGS="${CXXFLAGS}" \
		REL_CFLAGS= REL_CCFLAGS= \
		BF_BUILDDIR=${WRKBUILD} \
		BF_FANCY=0 \
		BF_QUIET=0 \
		BF_PYTHON=${LOCALBASE} BF_PYTHON_VERSION=${MODPY_VERSION} \
		BF_GLEW=${LOCALBASE} \
		BF_GLEW_LIB=GLEW BF_GLEW_LIBPATH=${LOCALBASE}/lib \
		BF_JPEG=${LOCALBASE} \
		BF_PNG=${LOCALBASE} \
		BF_SDL_INC="${LOCALBASE}/include/SDL ${LOCALBASE}/include" \
		BF_TIFF=${LOCALBASE} \
		BF_OPENGL=${X11BASE} \
		BF_ZLIB=/usr \
		WITH_BF_INTERNATIONAL=false \
		WITH_BF_STATICOPENGL=false \
		WITH_BF_FTGL=false \
		WITH_BF_BULLET=false

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/bin/blender ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/blender/scripts/bpymodules
	${INSTALL_DATA} ${WRKSRC}/release/scripts/*.py \
		${PREFIX}/share/blender/scripts
	${INSTALL_DATA} ${WRKSRC}/release/scripts/bpymodules/*.py \
		${PREFIX}/share/blender/scripts/bpymodules
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/blender
	${INSTALL_DATA} ${WRKSRC}/release/text/?lender* \
		${PREFIX}/share/doc/blender
	${INSTALL_DATA} ${WRKSRC}/release/text/*license* \
		${PREFIX}/share/doc/blender
	${INSTALL_DATA} ${WRKSRC}/release/text/copy* \
		${PREFIX}/share/doc/blender
	${INSTALL_DATA_DIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/release/freedesktop/icons/32x32/blender.png \
		${PREFIX}/share/pixmaps

.include <bsd.port.mk>
