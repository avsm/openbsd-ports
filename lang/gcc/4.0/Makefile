# $OpenBSD: Makefile,v 1.31 2010/11/28 21:30:37 jasper Exp $

ONLY_FOR_ARCHS=	alpha i386 m68k sparc sparc64 powerpc vax
BROKEN=adjust for types changes

V=4.0.3
FULL_VERSION=4.0-20060105
FULL_PKGVERSION=4.0.20060105

PKGNAME-f95=	g95-${FULL_PKGVERSION}
REVISION-f95 =  1

MAINTAINER=	Marc Espie <espie@openbsd.org>
SHARED_LIBS=	mudflap		0.0 \
		mudflapth	0.0 \
		estdc++		6.7 \
		gfortran	0.0 \
		objc		1.0 \
		objc_gc		1.0

MAKE_GXX=Yes
MAKE_FORTRAN=Yes
MAKE_OBJC=Yes
#MAKE_JAVA=Yes
.if ${MACHINE_ARCH} == "i386"
MAKE_ADA=Yes
.endif

MAKE_GXX?=No
MAKE_FORTRAN?=No
MAKE_OBJC?=No
MAKE_JAVA?=No
MAKE_ADA?=No
USE_GROFF =	Yes


BUILD_DEPENDS=	autoconf-2.13:devel/autoconf/2.13
BUILD_DEPENDS+= autoconf-2.59:devel/autoconf/2.59
BUILD_DEPENDS+=	devel/metaauto
SUBPACKAGE?=
WANTLIB=c
.if ${SUBPACKAGE} == "-estdc"
WANTLIB+=m
.endif

.if ${MAKE_JAVA:L} == "yes"
.  if !defined(PACKAGING) || ${SUBPACKAGE} == "-java"
LIB_DEPENDS+=devel/boehm-gc
WANTLIB += gc
.  endif
.endif

# This can be patched out, apart from java that wants a pure parser.
BUILD_DEPENDS+= devel/bison


.if ${MAKE_JAVA:L} == "yes"
MAKE_GXX=Yes
.endif

MULTI_PACKAGES=

REGRESS_DEPENDS=devel/dejagnu

# No way around it, java wants a pure parser
.if ${MAKE_JAVA:L} == "yes"
BUILD_DEPENDS+=devel/bison
.endif


DISTNAME=	gcc-${FULL_VERSION}


DISTFILES=  ${DISTNAME}.tar.bz2
#SUPDISTFILES=adastrap-i386-4.0-20050102-1.tgz:0
SUPDISTFILES=adastrap-i386-3.3.6-4.tgz:0

MASTER_SITES=	${MASTER_SITE_GCC:=snapshots/$(FULL_VERSION)/}
MASTER_SITES0=	ftp://quatramaran.ens.fr/pub/espie/

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/gcc

LANGS=c
.if ${MAKE_GXX:L} == "yes"
LANGS:=${LANGS},c++
MULTI_PACKAGES+=-c++ -estdc
.endif
.if ${MAKE_FORTRAN:L} == "yes"
LANGS:=${LANGS},f95
MULTI_PACKAGES+=-f95
CONFIGURE_ARGS+=--with-gmp=${LOCALBASE}
.endif
.if ${MAKE_OBJC:L} == "yes"
LANGS:=${LANGS},objc
MULTI_PACKAGES+=-objc
.endif
.if ${MAKE_JAVA:L} == "yes"
LANGS:=${LANGS},java
#MULTI_PACKAGES+=-java
CONFIGURE_ARGS+=--enable-java-gc=system-boehm
.endif
.if ${MAKE_ADA:L} == "yes"
LANGS:=${LANGS},ada
MULTI_PACKAGES+=-ada
#DISTFILES+=adastrap-${MACHINE_ARCH}-4.0-20050102-1.tgz:0
DISTFILES+=adastrap-${MACHINE_ARCH}-3.3.6-4.tgz:0
CONFIGURE_ENV=ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
MAKE_ENV=ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
CC=${WRKDIR}/bin/egcc

post-extract:
.for f in egcc gnatbind gnatmake gnatlink gnatls
	echo "#! /bin/sh" >${WRKDIR}/bin/$f
	echo 'GNAT_ROOT=${WRKDIR}/bootstrap GCC_ROOT=${WRKDIR}/bootstrap exec ${WRKDIR}/bootstrap/bin/$f "$$@"' >>${WRKDIR}/bin/$f
	chmod a+x ${WRKDIR}/bin/$f
.endfor
	echo "# This file automatically generated" >> ${WRKSRC}/libversions
.for l v in ${SHARED_LIBS}
	echo "LIB$l_LTVERSION = -version-info ${v:S/./:/}" >> ${WRKSRC}/libversions
.endfor

.endif
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
	--enable-libmudflap \
	--enable-languages=${LANGS}

# This is needed, as internal cpp is no longer compatible with the
# visible beast
CONFIGURE_ARGS+=--enable-cpp

.if ${MAKE_JAVA:L} == "yes"
CONFIGURE_ARGS+=--enable-sjlj-exceptions
.endif


# if you wish to try your luck
#CONFIGURE_ARGS+= --enable-threads=posix

CONFIGURE_ARGS += --with-gnu-as 
CONFIGURE_ARGS += --with-gnu-ld 
CONFIGURE_ARGS += ${CONFIGURE_SHARED}

post-patch:
	cd ${WRKDIST}/libstdc++-v3 && AUTOCONF_VERSION=2.59 autoconf

SEPARATE_BUILD=concurrent

USE_GMAKE= yes

# you shouldn't skip bootstrap unless you know what you're doing
# use bootstrap-lean if you're pressed for space
ALL_TARGET=bootstrap

MAKE_FLAGS=libstdc___la_LDFLAGS='-version-info 31:0:0 -lm'


.if ${MACHINE_ARCH} == "m68k" || ${MACHINE_ARCH} == "sparc"
PKG_ARGS+=-DPIC=1
.else
PKG_ARGS+=-DPIC=0
.endif

.if ${MACHINE_ARCH} == "powerpc"
PKG_ARGS+=-DPPC=1
.else
PKG_ARGS+=-DPPC=0
.endif

SUBPACKAGE?=
.if defined(PACKAGING)
.  if !empty(SUBPACKAGE) && ${SUBPACKAGE} != "-estdc"
RUN_DEPENDS+=gcc-${FULL_PKGVERSION}:${PKGPATH}
.  endif
.  if ${SUBPACKAGE} == "-c++"
RUN_DEPENDS+=${PKGPATH},-estdc
.  endif
.endif
.if !defined(PACKAGING) || ${SUBPACKAGE} == "-f95"
LIB_DEPENDS+=devel/gmp>=4.2
WANTLIB+= gmp mpfr
LIB_DEPENDS+=devel/mpfr
.endif

.include <bsd.port.mk>

