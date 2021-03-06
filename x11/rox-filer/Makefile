# $OpenBSD: Makefile,v 1.54 2011/04/16 10:53:15 jasper Exp $

COMMENT=		GTK+-2 file manager with desktop features

DISTNAME=		rox-filer-2.9
REVISION=		4
CATEGORIES=		x11

HOMEPAGE=		http://roscidus.com/desktop/

MAINTAINER=		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += ICE SM X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 c cairo expat
WANTLIB += fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 gtk-x11-2.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += xml2 z pthread-stubs xcb glade-2.0
WANTLIB += gthread-2.0 pthread xcb-render GL Xxf86vm drm xcb-shm

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=rox/}
EXTRACT_SUFX=	.tar.bz2

MODULES=	devel/gettext
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	misc/shared-mime-info
LIB_DEPENDS=	devel/libglade2

USE_GROFF =	Yes

NO_REGRESS=	Yes

INSTDATA=	AppRun Help Messages Options.xml ROX images style.css \
		subclasses .DirIcon

pre-configure:
	@perl -pi -e 's,/usr/local/share/Choices,${PREFIX}/share/rox/Choices,g' \
		${WRKSRC}/ROX-Filer/src/choices.c

do-build:
	@cd ${WRKSRC} && ${SETENV} MAKE="${MAKE_PROGRAM}" CC="${CC}" \
		CFLAGS="${CFLAGS}" CPPFLAGS="-I${X11BASE}/include" \
		with_platform="OpenBSD" ROX-Filer/AppRun --compile

do-install:
	@rm -f ${WRKSRC}/ROX-Filer/src/*.orig
	${INSTALL_DATA_DIR} ${PREFIX}/rox/ROX-Filer
	${INSTALL_MAN} ${WRKSRC}/rox.1 ${PREFIX}/man/man1/
	${INSTALL_MAN} ${WRKSRC}/rox.1 ${PREFIX}/man/man1/ROX-Filer.1
	${INSTALL_DATA_DIR} ${PREFIX}/share/rox/Choices/MIME-types
	${INSTALL_SCRIPT} ${WRKSRC}/Choices/MIME-types/* \
		${PREFIX}/share/rox/Choices/MIME-types
	${INSTALL_PROGRAM} ${WRKSRC}/ROX-Filer/ROX-Filer ${PREFIX}/rox/ROX-Filer
.for i in ${INSTDATA}
	@cp -R ${WRKSRC}/ROX-Filer/$i ${PREFIX}/rox/ROX-Filer
.endfor
	@echo '#!/bin/sh' > ${PREFIX}/bin/rox
	@echo 'exec ${TRUEPREFIX}/rox/ROX-Filer/AppRun "$$@"' >> ${PREFIX}/bin/rox
	@chmod ugo+rx ${PREFIX}/bin/rox

.include <bsd.port.mk>
