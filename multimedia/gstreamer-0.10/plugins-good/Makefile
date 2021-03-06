# $OpenBSD: Makefile,v 1.79 2011/09/30 19:05:50 ajacoutot Exp $

# XXX ossaudio(3) is only enabled to be used as a mixing device by
# audio/pulseaudio and x11/xfce4/xfce4-mixer

COMMENT-main =		good elements for GStreamer
COMMENT-aalib =		aalib element for GStreamer (plugins-good)
COMMENT-dv =		dv element for GStreamer (plugins-good)
COMMENT-caca =		libcaca element for GStreamer (plugins-good)

V =			0.10.30
DISTNAME =		gst-plugins-good-$V

PKGNAME-main =		gstreamer-plugins-good-${V}
PKGNAME-aalib =		gstreamer-aalib-${V}
PKGNAME-dv =		gstreamer-dv-${V}
PKGNAME-caca =		gstreamer-libcaca-${V}

REVISION-main = 	1
REVISION-aalib = 	1
REVISION-dv = 		1
REVISION-caca = 	1

EPOCH-main =		0

MULTI_PACKAGES =	-main -aalib \
			-dv -caca

MASTER_SITES =		${MASTER_SITE_GST:=gst-plugins-good/}

MODULES =		devel/gettext \
			devel/gconf2

USE_LIBTOOL=		Yes
# needs libtoolize
BUILD_DEPENDS +=	devel/libtool

MODGCONF2_LIBDEP=	No
MODGCONF2_SCHEMAS_DIR=	gst-plugins

.for i in ${MULTI_PACKAGES}
REGRESS_DEPENDS +=	${BASE_PKGPATH},${i}
.endfor

RUN_DEPENDS =		${BUILD_PKGPATH}
WANTLIB =		glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 \
			pcre xml2 m z gstreamer-0.10 gstbase-0.10
LIB_DEPENDS =		$P/core>=0.10.30

WANTLIB-main =		${WANTLIB} ${MODGCONF2_WANTLIB} gdk_pixbuf-2.0 \
			ICE SM X11 Xdamage Xext Xfixes sndio ossaudio \
			gstcontroller-0.10 Xau Xdmcp xcb-render cairo-gobject \
			pthread-stubs xcb Xrender cairo expat orc-0.4 \
			fontconfig freetype ogg pixman-1 png Xv \
			stdc++ theora vorbis ORBit-2 dbus-1 GL Xxf86vm \
			gstaudio-0.10 gstinterfaces-0.10 gstnetbuffer-0.10 \
			gstriff-0.10 gstrtp-0.10 gsttag-0.10 gstvideo-0.10 \
			gstfft-0.10 gstrtsp-0.10 gstsdp-0.10 gstpbutils-0.10 \
			FLAC jpeg tag wavpack speex gsttag-0.10 shout bz2 \
			gcrypt gio-2.0 gnome-keyring drm xcb-shm \
			gpg-error soup-2.4 soup-gnome-2.4 sqlite3
LIB_DEPENDS-main =	${LIB_DEPENDS} \
			${MODGCONF2_LIB_DEPENDS} \
			devel/orc>=0.4.6 \
			${P}/plugins-base \
			audio/flac \
			graphics/jpeg \
			audio/taglib \
			audio/wavpack \
			audio/speex \
			$P/plugins-base \
			net/libshout \
			archivers/bzip2 \
			devel/libsoup,-gnome \
			graphics/gdk-pixbuf2
RUN_DEPENDS-main =	${MODGCONF2_RUN_DEPENDS} \
			${MODGETTEXT_RUN_DEPENDS}

WANTLIB-aalib=		${WANTLIB} \
			X11 ncurses Xau Xdmcp pthread-stubs xcb aa
LIB_DEPENDS-aalib =	${LIB_DEPENDS} \
			graphics/aalib

WANTLIB-dv =		${WANTLIB} dv gstaudio-0.10 gstinterfaces-0.10
LIB_DEPENDS-dv =	${LIB_DEPENDS} \
			multimedia/libdv \
			${P}/plugins-base

WANTLIB-caca =		${WANTLIB} \
			X11 ncursesw Xau Xdmcp pthread-stubs xcb caca
LIB_DEPENDS-caca =	${LIB_DEPENDS} \
			graphics/libcaca

CONFIGURE_ARGS +=	--with-aalib-prefix=${LOCALBASE} \
			--disable-dv1394 \
			--disable-hal \
			--disable-osx_audio \
			--disable-osx_video \
			--disable-pulse \
			--disable-directsound \
			--disable-sunaudio \
			--disable-esd \
			--disable-esdtest \
			--disable-jack \
			--disable-oss4 \
			--disable-jack \
			--enable-gst_v4l2 \
			--enable-goom \
			--enable-orc
CONFIGURE_ENV +=	ac_cv_path_PYTHON=""

post-extract:
	cp -R ${FILESDIR} ${WRKSRC}/ext/libsndio

AUTOMAKE_VERSION =	1.10
BUILD_DEPENDS +=	${MODGNU_AUTOMAKE_DEPENDS}

# autopoint(1) uses HOME, make sure it exists
pre-configure:
	cd ${WRKSRC} && HOME=${WRKDIST} AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} AUTOMAKE=automake-${AUTOMAKE_VERSION} \
		NOCONFIGURE="true" ${CONFIGURE_ENV} ./autogen.sh ${CONFIGURE_ARGS}

.include <bsd.port.mk>
