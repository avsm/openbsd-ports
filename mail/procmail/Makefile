# $OpenBSD: Makefile,v 1.36 2010/11/19 07:23:09 espie Exp $

COMMENT=	filtering local mail delivery agent

DISTNAME=	procmail-3.22
CATEGORIES=	mail
REVISION =	3

MASTER_SITES=	${HOMEPAGE} \
		ftp://ftp.psg.com/pub/unix/procmail/ \
		ftp://ftp.ucsb.edu/pub/mirrors/procmail/ \
		ftp://ftp.informatik.rwth-aachen.de/pub/packages/procmail/ \
		ftp://ftp.fu-berlin.de/pub/unix/mail/procmail/ \
		ftp://ftp.net.ohio-state.edu/pub/networking/mail/procmail/ \
		ftp://ftp.kfki.hu/pub/packages/mail/procmail/ \
		ftp://ftp.ring.gr.jp/pub/net/mail/procmail/ \
		ftp://sunsite.cnlab-switch.ch/mirror/procmail/ 

HOMEPAGE=	http://www.procmail.org/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c m

FLAVORS=	lmtp
FLAVOR?=

USE_GROFF =	Yes
.if ${FLAVOR:L:Mlmtp}
CFLAGS+=	-DLMTP
.endif

MAKE_FLAGS=	BASENAME="${PREFIX}" CC="${CC}" CFLAGS0="${CFLAGS}" LOCKINGTEST="110"

NO_REGRESS=	Yes

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/procmail
	cd ${WRKBUILD}/new && \
	${INSTALL_PROGRAM} formail lockfile procmail ${PREFIX}/bin && \
	${INSTALL_SCRIPT} mailstat ${PREFIX}/bin && \
	${INSTALL_MAN} formail.1 lockfile.1 procmail.1 ${PREFIX}/man/man1 && \
	${INSTALL_MAN} procmailex.5 procmailrc.5 procmailsc.5 ${PREFIX}/man/man5
	${INSTALL_DATA} ${WRKSRC}/examples/* \
		${PREFIX}/share/examples/procmail

.include <bsd.port.mk>
