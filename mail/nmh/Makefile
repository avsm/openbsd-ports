# $OpenBSD: Makefile,v 1.29 2010/11/19 07:23:07 espie Exp $

COMMENT=	new MH mail handling program

DISTNAME=		nmh-1.3
CATEGORIES=     	mail
MASTER_SITES=		${MASTER_SITE_SAVANNAH:=nmh/}
HOMEPAGE=		http://www.nongnu.org/nmh/

# BSD-like
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c termcap

MAINTAINER=		William Yodlowsky <bsd@openbsd.rutgers.edu>

SYSCONFDIR=		${PREFIX}/lib/nmh
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--libdir='$${exec_prefix}/libexec' \
			--enable-apop \
			--with-locking=fcntl

FLAVORS=		sasl
FLAVOR?=

CONFIGURE_ENV+=		ac_cv_header_db_h=no
USE_GMAKE=		Yes
USE_GROFF =		Yes

.if ${FLAVOR:L:Msasl}
WANTLIB +=		sasl2
LIB_DEPENDS+=		security/cyrus-sasl2
CPPFLAGS+=		-I${LOCALBASE}/include/sasl
CONFIGURE_ARGS+=	--with-cyrus-sasl=${PREFIX}
.endif

NO_REGRESS=		Yes

.include <bsd.port.mk>
