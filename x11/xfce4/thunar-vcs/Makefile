# $OpenBSD: Makefile,v 1.17 2011/10/14 11:37:24 jasper Exp $

COMMENT =	Thunar vcs integration plugin

XFCE_VERSION =	0.1.4
THUNAR_PLUGIN =	thunar-vcs-plugin
REVISION=	1

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =	x11/xfce4

# --as-needed fucks linking with pthread
CONFIGURE_ARGS +=	--disable-linker-opts
# correctly find bindtextdomain
CONFIGURE_ENV +=	LIBS='-liconv'

RUN_DEPENDS =	x11/xfce4/thunar \
		devel/git
BUILD_DEPENDS +=x11/xfce4/thunar

LIB_DEPENDS =	x11/gtk+2 \
		devel/subversion

WANTLIB += X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender apr-1 aprutil-1 asn1
WANTLIB += atk-1.0 c cairo crypto db expat
WANTLIB += fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 gssapi gthread-2.0
WANTLIB += gtk-x11-2.0 krb5 m neon pcre pixman-1 png pthread
WANTLIB += pthread-stubs sasl2 sqlite3 ssl
WANTLIB += xcb xfce4util z xcb-render ffi
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += svn_client-1 svn_delta-1 svn_diff-1 svn_fs-1 svn_fs_base-1
WANTLIB += svn_fs_fs-1 svn_fs_util-1 svn_ra-1 svn_ra_local-1 svn_ra_neon-1
WANTLIB += svn_ra_svn-1 svn_repos-1 svn_subr-1 svn_wc-1 GL Xxf86vm drm xcb-shm

.include <bsd.port.mk>
