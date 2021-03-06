# $OpenBSD: Makefile,v 1.44 2011/09/16 10:31:23 espie Exp $

COMMENT-main =		base elements for GStreamer
COMMENT-cdda =		cd paranoia element for GStreamer (plugins-base)

V =			0.10.35
DISTNAME =		gst-plugins-base-${V}

PKGNAME-main =		gstreamer-plugins-base-${V}
PKGNAME-cdda =		gstreamer-cdda-${V}

REVISION-main = 	1
REVISION-cdda = 	1

MULTI_PACKAGES =	-main -cdda

SHARED_LIBS +=  gstinterfaces-0.10   2.5      # .23.0
SHARED_LIBS +=  gsttag-0.10          2.5      # .23.0
SHARED_LIBS +=  gstfft-0.10          2.5      # .23.0
SHARED_LIBS +=  gstnetbuffer-0.10    2.5      # .23.0
SHARED_LIBS +=  gstpbutils-0.10      2.5      # .23.0
SHARED_LIBS +=  gstrtp-0.10          2.5      # .23.0
SHARED_LIBS +=  gstsdp-0.10          2.5      # .23.0
SHARED_LIBS +=  gstvideo-0.10        2.5      # .23.0
SHARED_LIBS +=  gstapp-0.10          2.5      # .23.0
SHARED_LIBS +=  gstaudio-0.10        2.5      # .23.0
SHARED_LIBS +=  gstcdda-0.10         2.5      # .23.0
SHARED_LIBS +=  gstriff-0.10         2.5      # .23.0
SHARED_LIBS +=  gstrtsp-0.10         2.5      # .23.0

MASTER_SITES =		${MASTER_SITE_GST:=gst-plugins-base/}
MODULES =		devel/gettext

# XXX: the libtool wrapper script is passed as argument to g-ir-scanner,
# instead of the actual library
USE_LIBTOOL=	gnu

.for i in ${MULTI_PACKAGES}
REGRESS_DEPENDS +=	${BASE_PKGPATH},${i}
.endfor

RUN_DEPENDS =		${BUILD_PKGPATH}
WANTLIB =		glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 xml2 \
			z m pcre gstreamer-0.10
LIB_DEPENDS =		${P}/core>=0.10.30

WANTLIB-main =		${WANTLIB} \
			Xv X11 ICE SM Xext Xau Xdmcp Xxf86vm c drm \
			gstdataprotocol-0.10 gstcontroller-0.10 gstbase-0.10 \
			pthread-stubs xcb expat fontconfig freetype ogg \
			Xrender cairo gio-2.0 pixman-1 png pthread xcb-shm \
			xcb-render vorbis vorbisenc pango-1.0 \
			pangoft2-1.0 pangocairo-1.0 theoradec theoraenc \
			vorbisidec orc-0.4 orc-test-0.4 GL Xdamage Xfixes
LIB_DEPENDS-main = 	${LIB_DEPENDS} \
			devel/orc>=0.4.11 \
			audio/libvorbis \
			devel/pango \
			multimedia/libtheora \
			audio/tremor
RUN_DEPENDS-main +=	${MODGETTEXT_RUN_DEPENDS}
# needed for the gio plugin
RUN_DEPENDS-main +=	x11/gnome/gvfs

WANTLIB-cdda =		${WANTLIB} \
			gstbase-0.10 gsttag-0.10 cdda_interface cdda_paranoia
LIB_DEPENDS-cdda = 	${LIB_DEPENDS} \
			${BUILD_PKGPATH} \
			audio/cdparanoia

CONFIGURE_ARGS +=	--disable-libvisual \
			--disable-alsa \
			--disable-gst_v4l \
			--disable-gnome_vfs \
			--enable-orc
CONFIGURE_ENV +=	ac_cv_path_PYTHON=""
USE_GROFF =		Yes

.include <bsd.port.mk>
