# $OpenBSD: Makefile,v 1.49 2011/06/15 08:29:34 sthen Exp $

COMMENT=	Sound eXchange, the Swiss Army knife of audio manipulation

DISTNAME=	sox-14.3.2
SHARED_LIBS +=	sox 2.0 # .1.0

CATEGORIES=	audio
HOMEPAGE=	http://sox.sourceforge.net/
MAINTAINER=	Jan Stary <hans@stare.cz>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=		converters/libiconv

WANTLIB += c m ogg sndio z
WANTLIB += vorbis vorbisenc vorbisfile FLAC magic
WANTLIB += mad id3tag mp3lame wavpack png gsm

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=sox/}

# see CONFIGURE_ARGS below
LIB_DEPENDS=	audio/libvorbis \
		audio/flac \
		devel/libmagic \
		audio/libmad \
		audio/libid3tag \
		audio/lame \
		audio/wavpack \
		graphics/png \
		audio/gsm

USE_GROFF=	Yes
USE_LIBTOOL=	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	${CONFIGURE_SHARED} \
		--disable-silent-libtool

# Don't use modules
CONFIGURE_ARGS+=--without-libltdl

# Sound drivers
CONFIGURE_ARGS+=--without-ao \
		--without-oss \
		--with-sndio \
		--without-sunaudio

# Additional file formats
CONFIGURE_ARGS+=--without-sndfile \
		--with-oggvorbis \
		--with-flac \
		--without-ffmpeg \
		--with-magic \
		--with-mad \
		--with-id3tag \
		--with-lame \
		--without-amrwb \
		--without-amrnb \
		--with-wavpack \
		--with-png \
		--without-ladspa

CONFIGURE_ENV= \
	CPPFLAGS="-I${LOCALBASE}/include" \
	LDFLAGS="-L${LOCALBASE}/lib"

do-regress:
	@cd ${WRKSRC}/src && ./tests.sh && ./testall.sh

.include <bsd.port.mk>
