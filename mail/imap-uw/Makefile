# $OpenBSD: Makefile,v 1.24.2.1 2002/12/09 20:26:25 jakob Exp $

COMMENT=	University of Washington IMAP4rev1/POP2/POP3 mail servers

VERSION=	2002.334
DISTNAME=	imap-2002a.DEV.SNAP-0212051126
PKGNAME=	imap-uw-${VERSION}
CATEGORIES=	mail
NEED_VERSION=	1.491

EXTRACT_SUFX=	.tar.Z

HOMEPAGE=	http://www.washington.edu/imap/

MAINTAINER=     Jakob Schlyter <jakob@openbsd.org>

MASTER_SITES=	ftp://ftp.cac.washington.edu/imap/ \
		ftp://ftp.sunet.se/pub/unix/mail/imap/

PERMIT_PACKAGE_CDROM=	no
PERMIT_PACKAGE_FTP=	yes
PERMIT_DISTFILES_CDROM=	no
PERMIT_DISTFILES_FTP=	yes

ALL_TARGET=	bso
MAKE_FLAGS=	EXTRACFLAGS="${CFLAGS}" EXTRAAUTHENTICATORS="gss"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/imapd/imapd ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/ipopd/ipop2d ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/ipopd/ipop3d ${PREFIX}/libexec
	${INSTALL_MAN} ${WRKSRC}/src/imapd/imapd.8c ${PREFIX}/man/man8/imapd.8
	${INSTALL_MAN} ${WRKSRC}/src/ipopd/ipopd.8c ${PREFIX}/man/man8/ipopd.8

.include <bsd.port.mk>
