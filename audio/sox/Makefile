# $OpenBSD: Makefile,v 1.23.2.1 2004/07/31 18:12:27 robert Exp $

COMMENT=	"SOund eXchange - universal sound sample translator"

DISTNAME=	sox-12.17.4
PKGNAME=	${DISTNAME}p1
CATEGORIES=	audio
HOMEPAGE=	http://sox.sourceforge.net/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=sox/}

CONFIGURE_STYLE=autoconf
AUTOCONF_VERSION=2.54
CONFIGURE_ARGS=	--disable-sun-audio
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

FLAVORS=	mp3 vorbis
FLAVOR?=

.if ${FLAVOR:L:Mvorbis}
LIB_DEPENDS+=	vorbis.1,vorbisenc.1,vorbisfile.2::audio/libvorbis
.else
CONFIGURE_ARGS+= --disable-ogg-vorbis
.endif

.if ${FLAVOR:L:Mmp3}
LIB_DEPENDS+=	mad.1::audio/mad mp3lame.0::audio/lame
.else
CONFIGURE_ARGS+= --disable-mad --disable-lame
.endif

NO_REGRESS=	Yes

.include <bsd.port.mk>
