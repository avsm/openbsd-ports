# $OpenBSD: Makefile,v 1.40 2011/09/17 09:31:00 jasper Exp $

COMMENT=	perl-compatible regular expression library

DISTNAME=	pcre-8.13

SHARED_LIBS +=  pcre                 2.5      # 0.1
SHARED_LIBS +=  pcreposix            1.5      # 0.0
SHARED_LIBS +=  pcrecpp              3.3      # 0.0

CATEGORIES=	devel

MASTER_SITES=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/ \
		${MASTER_SITE_SOURCEFORGE:=pcre/}

HOMEPAGE=	http://www.pcre.org/

MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c m stdc++

USE_LIBTOOL=		Yes
USE_GROFF =		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		${CONFIGURE_SHARED} \
			--enable-utf8 \
			--enable-unicode-properties

# XXX compiler bugs
.if ${MACHINE_ARCH} == "vax"
CFLAGS+=	-O0
.endif

.include <bsd.port.mk>
