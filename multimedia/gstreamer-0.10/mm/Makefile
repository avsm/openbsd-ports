# $OpenBSD: Makefile,v 1.10 2011/07/21 06:37:09 ajacoutot Exp $

COMMENT =	C++ bindings for GStreamer

V =		0.10.10
NAME =		gstreamermm
DISTNAME =	${NAME}-${V}

SHARED_LIBS +=  gstreamermm_get_plugin_defs-0.10 1.0 # .2.1
SHARED_LIBS +=  gstreamermm-0.10                 1.0 # .2.1

WANTLIB += c gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gstaudio-0.10
WANTLIB += gstbase-0.10 gstcontroller-0.10 gstdataprotocol-0.10
WANTLIB += gstinterfaces-0.10 gstnet-0.10 gstnetbuffer-0.10 gstreamer-0.10
WANTLIB += gstrtp-0.10 gsttag-0.10 gstvideo-0.10 gthread-2.0 m
WANTLIB += pcre pthread sigc-2.0 stdc++ xml2 z giomm-2.4 glibmm-2.4
WANTLIB += glibmm_generate_extra_defs-2.4 gstcdda-0.10 xml++-2.6
WANTLIB += gstpbutils-0.10

MASTER_SITES =	${MASTER_SITE_GNOME:=sources/${NAME}/${V:C/^([0-9]+\.[0-9]+).*/\1/}/}

MODULES =	devel/gettext

MODPY_RUNDEP =	No

BUILD_DEPENDS =	devel/doxygen
LIB_DEPENDS =	devel/glib2mm \
		multimedia/gstreamer-0.10/plugins-base,-cdda \
		textproc/libxml++

CONFIGURE_STYLE =	gnu

.include <bsd.port.mk>
