# $OpenBSD: gnustep.port.mk,v 1.7 2008/11/14 10:34:15 ajacoutot Exp $

# until tested on others
ONLY_FOR_ARCHS=	i386 amd64

# plmerge needs to create a lock directory under the user's homedir
NO_SYSTRACE=	Yes

SHARED_ONLY=	Yes

CATEGORIES+=	x11/gnustep

USE_GMAKE?=	Yes
MAKE_FILE?=	GNUmakefile

BUILD_DEPENDS+=	:gnustep-make-*:x11/gnustep/make
RUN_DEPENDS+=	:gnustep-make-*:x11/gnustep/make

MAKE_FLAGS+=	CC="${CC}" CPP="${CC} -E" OPTFLAG="${CFLAGS}"

MAKE_ENV+=	GNUSTEP_MAKEFILES=`gnustep-config --variable=GNUSTEP_MAKEFILES`
MAKE_ENV+=	INSTALL_AS_USER=${BINOWN}
MAKE_ENV+=	INSTALL_AS_GROUP=${BINGRP}

MAKE_ENV+=	messages=yes

.ifdef DEBUG
MAKE_ENV+=	debug=yes strip=no
.else
MAKE_ENV+=	debug=no
.endif

MASTER_SITE_GNUSTEP= ftp://ftp.gnustep.org/pub/gnustep/
