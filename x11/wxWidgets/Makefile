# $OpenBSD: Makefile,v 1.36 2011/09/16 12:29:17 espie Exp $

SHARED_ONLY =	Yes

COMMENT =	c++ cross-platform GUI toolkit

V =		2.8.12
DISTNAME =	wxWidgets-${V}
PKGNAME =	wxWidgets-gtk2-${V}
REVISION=	0

SHARED_LIBS =	wx_base			2.1	\
		wx_base_net		2.1	\
		wx_base_odbc		2.1	\
		wx_base_xml		2.1	\
		wx_gtk2_adv		2.1	\
		wx_gtk2_aui		2.1	\
		wx_gtk2_core		2.1	\
		wx_gtk2_dbgrid		2.1	\
		wx_gtk2_fl		2.1	\
		wx_gtk2_gizmos		2.1	\
		wx_gtk2_gizmos_xrc	2.1	\
		wx_gtk2_gl		2.1	\
		wx_gtk2_html		2.1	\
		wx_gtk2_ogl		2.1	\
		wx_gtk2_plot		2.1	\
		wx_gtk2_qa		2.1	\
		wx_gtk2_richtext	2.1	\
		wx_gtk2_stc		2.1	\
		wx_gtk2_svg		2.1	\
		wx_gtk2_xrc		2.1
CATEGORIES =	x11

HOMEPAGE =	http://www.wxwidgets.org/

# modified LGPL
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=wxwindows/}

MODULES	=	devel/gettext
USE_GMAKE =	Yes
VMEM_WARNING =	Yes

BUILD_DEPENDS =	devel/cppunit

LIB_DEPENDS =	archivers/libmspack \
		devel/sdl \
		x11/gtk+2 \
		databases/iodbc

REGRESS_DEPENDS +=${BUILD_PKGPATH}>=${V}

WANTLIB += GL GLU SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender Xxf86vm atk-1.0
WANTLIB += c drm expat fontconfig freetype gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 gthread-2.0 jpeg m pango-1.0
WANTLIB += pangoft2-1.0 pixman-1 png pthread stdc++ SDL iodbc
WANTLIB += tiff z pthread-stubs xcb xcb-render xcb-shm mspack
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gtk-x11-2.0

AUTOCONF_VERSION = 2.59
CONFIGURE_ENV =	LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib -pthread" \
		CPPFLAGS="-I${LOCALBASE}/include -I${LOCALBASE}/include/libpng -I${X11BASE}/include" \
		ac_cv_lib_esd_esd_close=no \
		ac_cv_func_swprintf=no \
		wx_cv_func_wprintf=no \
		wx_cv_func_vswprintf=no
CONFIGURE_STYLE =autoconf no-autoheader
CONFIGURE_ARGS =--with-expat=sys \
		--with-odbc=sys \
		--with-libjpeg=sys \
		--with-libpng=sys \
		--with-libtiff=sys \
		--with-libxpm=sys \
		--with-zlib=sys \
		--with-regex=builtin \
		--with-gtk \
		--with-opengl \
		--with-sdl \
		--without-gnomeprint \
		--without-gnomevfs \
		--without-hildon \
		--enable-gui \
		--enable-sound \
		--enable-unicode \
		--disable-backtrace \
		--disable-stl

.ifdef DEBUG
CONFIGURE_ARGS += --enable-debug
.endif

.for _l _v in ${SHARED_LIBS}
MAKE_ENV +=	LIB${_l}_VERSION=${_v}
.endfor

MAKE_FLAGS =	WXUNICODEFLAG=""

do-regress:
	@cd ${WRKSRC}/tests && \
		${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} && ./test

.include <bsd.port.mk>
