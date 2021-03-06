# $OpenBSD: Makefile,v 1.43 2011/09/28 09:51:36 jasper Exp $

SHARED_ONLY =	Yes

COMMENT =	personal and small-business financial-accounting software

GNOME_PROJECT =	gnucash
GNOME_VERSION =	2.2.9
DOC_VERSION = 	2.2.0

REVISION=	7

SHARED_LIBS +=	gnc-backend-file-utils	0.0	# .0.0
SHARED_LIBS +=	gnc-business-ledger	0.0	# .0.0
SHARED_LIBS +=	gnc-core-utils		0.0	# .0.0
SHARED_LIBS +=	gnc-gnome		0.0	# .0.0
SHARED_LIBS +=	gnc-module		0.0	# .0.0
SHARED_LIBS +=	gnc-qof			1.4	# .1.4
SHARED_LIBS +=	gncmod-qif		0.0	# .0.0

CATEGORIES =	productivity

HOMEPAGE =	http://www.gnucash.org/

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

EXTRACT_SUFX=		.tar.bz2

WANTLIB += ICE ORBit-2 ORBitCosNaming-2 SM X11 Xau Xcomposite
WANTLIB += Xcursor Xdamage Xdmcp Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender art_lgpl_2 atk-1.0
WANTLIB += bonobo-2 bonobo-activation bonoboui-2 bz2
WANTLIB += c cairo crypto dbus-1 dbus-glib-1 enchant expat fontconfig
WANTLIB += freetype gailutil gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glade-2.0 glib-2.0 gmodule-2.0 gmp gnome-2 gnome-keyring
WANTLIB += gnomecanvas-2 gnomevfs-2 gobject-2.0 gsf-1 gthread-2.0
WANTLIB += gtk-x11-2.0 ltdl m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pcre pixman-1 png popt pthread pthread-stubs ssl stdc++
WANTLIB += util xcb xcb-render xcb-render-util xml2 z
WANTLIB += canberra gcrypt gpg-error ogg vorbis vorbisfile
WANTLIB += goffice-0.8 guile gtkhtml-3.14 gnomeui-2

MASTER_SITES =	${MASTER_SITE_SOURCEFORGE:=gnucash/} \
		${HOMEPAGE}pub/gnucash/sources/stable/

DISTFILES =	${DISTNAME}${EXTRACT_SUFX} \
		gnucash-docs-${DOC_VERSION}.tar.gz

MODULES =	devel/gettext \
		x11/gnome \
		devel/gconf2

MODGNOME_DESKTOP_FILE =	Yes
MODGCONF2_SCHEMAS_DIR = gnucash
MODGNOME_TOOLS= 	yelp

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS =	devel/slib \
		devel/slib-guile
LIB_DEPENDS =	devel/goffice \
		lang/guile \
		www/gtkhtml3 \
		x11/gnome/libgnomeui

CONFIGURE_STYLE =	gnu
# --disable-ofx until libofx/libsp is fixed to work with .so
CONFIGURE_ARGS +=	--disable-doxygen \
			--disable-ofx
MODGNOME_CPPFLAGS=	-I${X11BASE}/include
USE_GROFF =		Yes

# Steps to build the docs.
DOC_DIR=		${WRKDIR}/gnucash-docs-${DOC_VERSION}
post-configure:
	cd ${DOC_DIR} && ${SETENV} ${CONFIGURE_ENV} /bin/sh ./configure

post-build:
	cd ${DOC_DIR} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS}

post-install:
	cd ${DOC_DIR} && \
		${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${ALL_FAKE_FLAGS} install

.include <bsd.port.mk>
