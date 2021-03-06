# $OpenBSD: Makefile,v 1.40 2011/09/16 12:29:15 espie Exp $

COMMENT=	GNUstep base library

DISTNAME=	gnustep-base-1.22.1
REVISION=	0

SHARED_LIBS=	gnustep-base 4.0
CATEGORIES=	devel

LIBDIR=		lib/GNUstep/Libraries/gnustep-base/Versions/${LIBgnustep-base_VERSION}
SUBST_VARS=	LIBDIR

HOMEPAGE=	http://www.gnustep.org/

WANTLIB += c crypto gcrypt m objc pthread ssl xml2 z ffi gmp xslt gnutls
WANTLIB += avahi-client avahi-common icudata icui18n icuuc

.if ${MACHINE_ARCH} != "i386" && ${MACHINE_ARCH} != "amd64"
WANTLIB += iberty
.endif

MASTER_SITES=	${MASTER_SITE_GNUSTEP:=core/}

MODULES=	x11/gnustep \
		converters/libiconv
MODGNUSTEP_NEEDS_GUI=	No
MODGNUSTEP_NEEDS_BASE=	No

LIB_DEPENDS +=	devel/libffi \
		devel/gmp \
		textproc/libxslt \
		security/gnutls \
		textproc/icu4c \
		net/avahi

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS +=	--disable-procfs \
			--disable-procfs-psinfo

pre-configure:
	@perl -pi -e 's,^MAJOR_VERSION=.*,MAJOR_VERSION=${LIBgnustep-base_VERSION:R},g;' \
		-e 's,^MINOR_VERSION=.*,MINOR_VERSION=${LIBgnustep-base_VERSION:E},g' \
		${WRKSRC}/Version

.include <bsd.port.mk>
