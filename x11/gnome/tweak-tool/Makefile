# $OpenBSD: Makefile,v 1.11 2011/09/28 06:23:15 ajacoutot Exp $

COMMENT=	tweak hidden GTK/GNOME settings

GNOME_PROJECT=	gnome-tweak-tool
GNOME_VERSION=	3.2.0

CATEGORIES=	sysutils

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	x11/gnome \
		lang/python

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	devel/gsettings-desktop-schemas \
		devel/gconf2 \
		devel/gettext \
		devel/py-gobject3

MODPY_ADJ_FILES=gnome-tweak-tool

MODGNOME_DESKTOP_FILE=		Yes

# XXX see post-install
# https://bugzilla.gnome.org/show_bug.cgi?id=647132
#RUN_DEPENDS +=	x11/gnome/shell

# XXX
pre-configure:
	perl -pi -e 's,PYGOBJECT_REQUIRED_VERSION\),PYGOBJECT_REQUIRED_VERSION,g' \
		${WRKSRC}/configure

post-install:
	rm ${WRKINST}${MODPY_LIBDIR}/site-packages/gtweak/tweaks/tweak_shell{,_extensions}.p*

.include <bsd.port.mk>
