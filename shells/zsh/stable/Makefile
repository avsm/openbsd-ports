# $OpenBSD: Makefile,v 1.7.2.1 2001/11/18 23:33:50 lebel Exp $

COMMENT=	"Z shell, Bourne shell-compatible, release flavor"
COMMENT-zftp=	"Z shell embedded ftp client"

VERSION=	4.0.2
DISTNAME=	zsh-${VERSION}
CATEGORIES=	shells
NEED_VERSION=	1.402
MASTER_SITES=	ftp://ftp.zsh.org/zsh/old/ \
		ftp://ftp.sterling.com/zsh/old/ \
		ftp://ftp.rge.com/pub/zsh/old/ \
		ftp://ftp.cenatls.cena.dgac.fr/pub/shells/zsh/old/ \
		ftp://mrrl.lut.ac.uk/zsh/old/ \
		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/old/ \
		ftp://ftp.ips.oz.au/pub/packages/zsh/old/ \
		ftp://ftp.uit.no/pub/unix/shells/zsh/old/
EXTRACT_SUFX=	.tar.bz2

HOMEPAGE=	http://www.zsh.org/

MAINTAINER=	David Lebel <lebel@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

FLAVORS=	static
FLAVOR?=

CONFIGURE_STYLE= autoconf
CONFIGURE_ARGS=	--enable-zsh-mem --enable-zsh-secure-free

.if ${FLAVOR:L} == "static"
CONFIGURE_ENV=	LDFLAGS="-static"
CONFIGURE_ARGS+=--disable-dynamic
.else
# we only enable sub-packages if the FLAVOR is not static
MULTI_PACKAGES=	-zftp
SUBPACKAGE?=
.for i in ${MULTI_PACKAGES}
PKGNAME$i=	zsh$i-${VERSION}
.endfor
CONFIGURE_ARGS+= ${CONFIGURE_SHARED:S/shared/dynamic/}
.endif

SUBST_VARS=	VERSION

.include <bsd.port.mk>
