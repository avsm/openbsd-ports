# $OpenBSD: Makefile,v 1.17.2.1 2001/06/12 23:49:16 lebel Exp $

VERSION=	3.1.9
DISTNAME=	zsh-${VERSION}
CATEGORIES=	shells
NEED_VERSION=	1.336
MASTER_SITES=	ftp://ftp.zsh.org/zsh/old/ \
		ftp://ftp.sterling.com/zsh/old/ \
		ftp://ftp.rge.com/pub/zsh/old/ \
		ftp://ftp.cenatls.cena.dgac.fr/pub/shells/zsh/old/ \
		ftp://mrrl.lut.ac.uk/zsh/old/ \
		ftp://ftp.fu-berlin.de/pub/unix/shells/zsh/old/ \
		ftp://ftp.ips.oz.au/pub/packages/zsh/old/ \
		ftp://ftp.uit.no/pub/unix/shells/zsh/old/

HOMEPAGE=	http://www.zsh.org/

MAINTAINER=	ports@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

SUBST_VARS=	VERSION

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--enable-zsh-mem --enable-zsh-secure-free \
		--enable-fndir='$${datadir}/zsh/functions' \
		--disable-dynamic

FLAVORS=	static
FLAVOR?=

.if ${FLAVOR:L} == "static"
CONFIGURE_ENV=	LDFLAGS="-static"
.endif

.include <bsd.port.mk>
