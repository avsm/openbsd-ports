# $OpenBSD: Makefile,v 1.35.2.1 2003/06/04 16:03:58 brad Exp $

COMMENT=	'GNU privacy guard - a free PGP replacement'

DISTNAME=	gnupg-1.0.7
PKGNAME=	${DISTNAME}p1
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.gnupg.org/gcrypt/gnupg/ \
		ftp://gd.tuwien.ac.at/privacy/gnupg/gnupg/ \
		ftp://crypto.yashy.com/pub/cryptography/gnupg/ \
		ftp://ftp.planetmirror.com/pub/gnupg/gnupg/ \
		ftp://sunsite.dk/pub/security/gcrypt/gnupg/ \
		ftp://ftp.linux.it/pub/mirrors/gnupg/gnupg/ \
		ftp://pgp.iijlab.net/pub/pgp/gnupg/ \
		ftp://ring.aist.go.jp/pub/net/gnupg/gnupg/

MASTER_SITES0=	ftp://ftp.ruhr-uni-bochum.de/mirrors/ftp.gnupg.org/pub/gcrypt/contrib/ \
	ftp://ftp.uni-bielefeld.de/pub/crypto/replay/mirror/ftp.pgp.net/gnupgp/contrib/ \
	ftp://ftp.fh-schmalkalden.de/pub/dfncert/crypt/gcrypt/contrib/

DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

HOMEPAGE=	http://www.gnupg.org/

MAINTAINER=	Reinhard J. Sammer <reinhard@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

.include <bsd.own.mk>

MODULES=	gettext

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/scripts

REGRESS_TARGET=	check

FLAVORS=	idea
FLAVOR?=

.if ${FLAVOR:L} == "idea"
PERMIT_PACKAGE_CDROM=	"a patented algorithm"
PERMIT_PACKAGE_FTP=	"a patented algorithm"
PERMIT_DISTFILES_CDROM=	"a patented algorithm"
PERMIT_DISTFILES_FTP=	"a patented algorithm"
# NB: idea.c is found in ${MASTER_SITES0}
DISTFILES+=	idea.c:0
PATCH_LIST=	idea-* patch-*
pre-patch:
	@cp ${DISTDIR}/idea.c ${WRKSRC}/cipher
.endif

GNUPGDOCFILES=	README AUTHORS COPYING THANKS TODO BUGS \
		doc/DETAILS doc/FAQ doc/OpenPGP doc/HACKING doc/faq.html

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/gnupg
	cd ${WRKSRC}; ${INSTALL_DATA} ${GNUPGDOCFILES} \
		${PREFIX}/share/doc/gnupg

# XXX workaround gcc bugs on sparc64
.if ${MACHINE_ARCH:Msparc64}
CFLAGS+=-O0
.endif

.include <bsd.port.mk>
