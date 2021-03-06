# $OpenBSD: Makefile,v 1.10 2011/03/07 18:59:56 ajacoutot Exp $

ONLY_FOR_ARCHS=	alpha i386 m68k sparc sparc64 powerpc vax amd64
#BROKEN=adjust for types changes

V=4.3.0
DATE=20070309
FULL_VERSION=4.3-${DATE}
FULL_PKGVERSION=4.3.${DATE}

PKGNAME-main=  gcc-${FULL_PKGVERSION}
PKGNAME-c++ =  g++-${FULL_PKGVERSION}
PKGNAME-estdc= libstdc++-${FULL_PKGVERSION}
PKGNAME-g77=   g77-${FULL_PKGVERSION}
PKGNAME-f95=   g95-${FULL_PKGVERSION}
PKGNAME-java=  gcj-${FULL_PKGVERSION}
PKGNAME-objc=  gobjc-${FULL_PKGVERSION}
PKGNAME-ada=   gnat-${FULL_PKGVERSION}

REVISION-main=	2
REVISION-c++=	0
REVISION-estdc= 0
REVISION-g77=	0
REVISION-f95=	1
REVISION-java=	0
REVISION-objc=	0
REVISION-ada=	0

SHARED_LIBS=	estdc++		7.0 \
		gfortran	2.0 \
		-org-w3c-dom	1.0 \
		-org-xml-sax	1.0 \
		gcj		5.0 \
		objc		2.0 \
		objc_gc		2.0 \
		ssp		0.0 \
		gomp		1.0

MAINTAINER=	Marc Espie <espie@openbsd.org>

USE_GROFF =	Yes
PSEUDO_FLAVORS=c++ fortran objc java ada
.if ${MACHINE_ARCH} == "i386"
FLAVOR?=c++ fortran objc ada
.else
FLAVOR?=c++ fortran objc
.endif

.if ${FLAVOR:L:Mjava}
FLAVOR+=c++
.endif

DISTFILES=  ${DISTNAME}.tar.bz2
SUPDISTFILES=	adastrap-i386-3.3.6-4.tgz:0

BUILD_DEPENDS+= :autoconf-2.59*:devel/autoconf/2.59
BUILD_DEPENDS+=	devel/metaauto
USE_LIBTOOL=	Yes

BUILD_DEPENDS+= :bison-*:devel/bison


MULTI_PACKAGES=	-main

REGRESS_DEPENDS=devel/dejagnu


DISTNAME=   	gcc-${FULL_VERSION}



MASTER_SITES=	${MASTER_SITE_GCC:=snapshots/$(FULL_VERSION)/}
MASTER_SITES0=	ftp://quatramaran.ens.fr/pub/espie/

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/gcc
CONFIGURE_ARGS+=--with-gmp=${LOCALBASE}

LANGS=c
.if ${FLAVOR:L:Mc++}
LANGS:=${LANGS},c++
MULTI_PACKAGES+=-c++ -estdc
.endif
.if ${FLAVOR:L:Mfortran}
LANGS:=${LANGS},fortran
MULTI_PACKAGES+=-f95
.endif
.if ${FLAVOR:L:Mobjc}
LANGS:=${LANGS},objc
MULTI_PACKAGES+=-objc
.endif
.if ${FLAVOR:L:Mjava}
LANGS:=${LANGS},java
#MULTI_PACKAGES+=-java
CONFIGURE_ARGS+=--enable-java-gc=system-boehm
.endif
.if ${FLAVOR:L:Mada}
LANGS:=${LANGS},ada
MULTI_PACKAGES+=-ada
DISTFILES+=adastrap-${MACHINE_ARCH}-3.3.6-4.tgz:0
CONFIGURE_ENV=ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
MAKE_ENV=ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
CC=${WRKDIR}/bin/egcc
.endif

post-extract:
.for f in egcc gnatbind gnatmake gnatlink
	echo "#! /bin/sh" >${WRKDIR}/bin/$f
	echo 'GNAT_ROOT=${WRKDIR}/bootstrap GCC_ROOT=${WRKDIR}/bootstrap exec ${WRKDIR}/bootstrap/bin/$f "$$@"' >>${WRKDIR}/bin/$f
	chmod a+x ${WRKDIR}/bin/$f
.endfor
	ln -s /usr/bin/nm ${WRKDIR}/bin/enm
	echo "# This file automatically generated" >> ${WRKSRC}/libversions
.for l v in ${SHARED_LIBS}
	echo "LIB$l_LTVERSION = -version-info ${v:S/./:/}" >> ${WRKSRC}/libversions
.endfor

post-install:
.if ${FLAVOR:L:Mada}
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/adainclude
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/adalib
.endif
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/include
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/include-fixed
CONFIGURE_ENV+=am_cv_func_iconv=no
CONFIGURE_ENV+=ac_cv_prog_CONFIGURED_M4=/usr/bin/m4

# Note: the configure target passes CFLAGS to the configure script anyways.

CFLAGS=-O2 -g


CONFIGURE_ARGS+= \
	--verbose \
	--program-transform-name=s,^,e, \
	--disable-nls  \
	--disable-checking \
	--with-system-zlib \
	--disable-libmudflap \
	--disable-libgomp \
	--with-as=/usr/bin/as \
	--with-ld=/usr/bin/ld \
	--with-gnu-ld \
	--with-gnu-as \
	--enable-languages=${LANGS}

# This is needed, as internal cpp is no longer compatible with the
# visible beast
CONFIGURE_ARGS+=--enable-cpp

.if ${FLAVOR:L:Mjava}
CONFIGURE_ARGS+=--enable-sjlj-exceptions
.endif


# if you wish to try your luck
#CONFIGURE_ARGS+= --enable-threads=posix

CONFIGURE_ARGS += --with-gnu-as 
CONFIGURE_ARGS += --with-gnu-ld 
CONFIGURE_ARGS += ${CONFIGURE_SHARED}

post-patch:
	cd ${WRKDIST}/libstdc++-v3 && AUTOCONF_VERSION=2.59 autoconf

SEPARATE_BUILD=flavored

USE_GMAKE= yes

# you shouldn't skip bootstrap unless you know what you're doing
# use bootstrap-lean if you're pressed for space
ALL_TARGET=bootstrap

BASIC_MAKE_FLAGS=libstdc___la_LDFLAGS='-version-info 31:0:0 -lm'
MAKE_FLAGS=${BASIC_MAKE_FLAGS} \
	INSTALL='/usr/bin/install -c' \
	INSTALL_PROGRAM='/usr/bin/install -c -m 555' \
	INSTALL_DATA='/usr/bin/install -c -m 444' \

.if ${MACHINE_ARCH} == "m68k" || ${MACHINE_ARCH} == "sparc"  || ${MACHINE_ARCH} == "amd64"
PKG_ARGS+=-DPIC=1
.else
PKG_ARGS+=-DPIC=0
.endif

.if ${MACHINE_ARCH} == "powerpc"
PKG_ARGS+=-DPPC=1
.else
PKG_ARGS+=-DPPC=0
.endif
.if ${MACHINE_ARCH} == "i386"
PKG_ARGS+=-DI386=1
.else
PKG_ARGS+=-DI386=0
.endif

RUN_DEPENDS=		:gcc-${FULL_PKGVERSION}:${PKGPATH}
WANTLIB=		c mpfr

RUN_DEPENDS-main=

RUN_DEPENDS-c++ =	${RUN_DEPENDS} ${PKGPATH},-estdc
LIB_DEPENDS-estdc=
WANTLIB-estdc=		c m

LIB_DEPENDS+=		gmp:gmp->=4.2:devel/gmp \
			devel/mpfr

LIB_DEPENDS-java=	${LIB_DEPENDS} \
			devel/boehm-gc

WANTLIB-java = ${WANTLIB} gc

.include <bsd.port.mk>

