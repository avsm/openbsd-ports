# $OpenBSD: Makefile,v 1.8 2010/10/19 08:02:53 espie Exp $

COMMENT=	convert man pages to HTML

DISTNAME=	man2web-0.88
CATEGORIES=	www
HOMEPAGE=	http://man2web.sourceforge.net/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=man2web/}

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-distro=openbsd-3
CONFIGURE_ARGS+= --disable-lynx		# requires lynxcgi support
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/helpers

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/man2web
USE_GROFF =	Yes

.include <bsd.port.mk>
