# $OpenBSD: Makefile,v 1.47 2011/09/16 10:02:38 espie Exp $

COMMENT=	API for accessing scanners, backends

DISTNAME=	sane-backends-1.0.22

REVISION=	6

SHARED_LIBS=	sane 2.0 # .1.0
CATEGORIES=	graphics

HOMEPAGE=	http://www.sane-project.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += c jpeg m tiff usb z

MASTER_SITES=	ftp://ftp.sane-project.org/pub/sane/${DISTNAME}/ \
		ftp://ftp.sane-project.org/pub/sane/old-versions/${DISTNAME}/ \
		ftp://ftp2.sane-project.org/pub/sane/${DISTNAME}/

LIB_DEPENDS=	graphics/tiff \
		devel/libusb

FLAVORS=	snmp
FLAVOR?=

USE_LIBTOOL=	Yes
USE_GMAKE=	Yes
USE_GROFF=	Yes

NO_REGRESS=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		ac_cv_path_MAKEDEPEND="no"
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--sbindir=${PREFIX}/libexec \
		--with-docdir=${PREFIX}/share/doc/sane-backends \
		--localstatedir=/var/spool \
		--without-gphoto2 \
		--with-group=553 \
		--disable-latex

# XXX doesn't work
#CONFIGURE_ARGS+=--enable-avahi

.if ${FLAVOR:L:Msnmp}
LIB_DEPENDS +=	net/net-snmp
WANTLIB +=	crypto netsnmp
CONFIGURE_ARGS += --with-snmp
.else
CONFIGURE_ARGS += --without-snmp
.endif

FAKE_FLAGS=	configdir=${PREFIX}/share/examples/sane-backends/sane.d

post-install:
	# removing the microtek2 backend which needs a Linux kernel module
	find ${PREFIX} -name \*microtek2\* | xargs rm
	cp -R ${WRKSRC}/tools/openbsd/ \
		${PREFIX}/share/examples/sane-backends/hotplug

.include <bsd.port.mk>
