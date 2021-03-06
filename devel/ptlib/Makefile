# $OpenBSD: Makefile,v 1.9 2011/09/16 09:24:54 espie Exp $

SHARED_ONLY=	Yes

COMMENT=	portable tools library

DISTNAME=	ptlib-2.6.7
REVISION=		0

SHARED_LIBS=	pt	3.0	# 2.4.2

EXTRACT_SUFX=	.tar.bz2

CATEGORIES=	devel telephony

HOMEPAGE=	http://www.opalvoip.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# MPL 1.0
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	c crypto expat m sasl2 sndio ssl lber ldap ldap_r SDL

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=opalvoip/}

BUILD_DEPENDS=	devel/bison \
		${MODGNU_AUTOCONF_DEPENDS} \
		${MODGNU_AUTOMAKE_DEPENDS}
LIB_DEPENDS=	databases/openldap \
		devel/sdl

.include <bsd.own.mk>
.if !${COMPILER_VERSION:L:Mgcc4}
PATCH_LIST = patch-* gcc3-patch-*
.endif

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--with-plugin-installdir=ptlib \
		--enable-appshare \
		--enable-plugins \
		--enable-bsdvideo \
		--enable-sasl \
		--enable-openldap \
		--enable-audio \
		--enable-video \
		--enable-vidfile \
		--enable-shmvideo \
		--enable-v4l2 \
		--enable-sndio \
		--enable-openssl \
		--disable-oss \
		--disable-alsa \
		--disable-avc \
		--disable-dc \
		--disable-odbc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		OPENSSL_CFLAGS="-I/usr/include" \
		OPENSSL_LIBS="-lssl -lcrypto -lm"

AUTOCONF_VERSION=	2.61
AUTOMAKE_VERSION=	1.9
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC} ${WRKSRC}/plugins

MAKE_FLAGS=	MAJOR_VERSION=${LIBpt_VERSION:R} \
		MINOR_VERSION=${LIBpt_VERSION:E}

USE_GMAKE=	Yes
NO_REGRESS=	Yes

ALL_TARGET=	optshared

post-patch:
	@mkdir ${WRKSRC}/plugins/sound_sndio
	@cp ${FILESDIR}/{Makefile,sound_sndio.*} ${WRKSRC}/plugins/sound_sndio

pre-configure:
	${SUBST_CMD} ${WRKSRC}/make/common.mak \
		${WRKSRC}/src/ptlib/common/pluginmgr.cxx \
		${WRKSRC}/include/ptlib/pluginmgr.h
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} aclocal
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoconf
	cd ${WRKSRC}/plugins && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoconf

post-install:
	${INSTALL_DATA} ${WRKSRC}/version.h ${PREFIX}/share/ptlib

.include <bsd.port.mk>
