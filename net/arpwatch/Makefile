# $OpenBSD: Makefile,v 1.25 2011/03/14 20:42:11 sthen Exp $

COMMENT=	monitor arp & rarp requests

DISTNAME=	arpwatch-2.1a15
DATAFILE=	arpwatch-ethercodes.20110313
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DATAFILE}:0
REVISION=	1
CATEGORIES=	net

MASTER_SITES=	ftp://ftp.ee.lbl.gov/
MASTER_SITES0=	http://spacehopper.org/mirrors/

MAINTAINER=	Jakob Schlyter <jakob@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c pcap

EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--quiet
MAKE_FLAGS+=		ARPDIR=/var/arpwatch

USE_GROFF=	Yes
NO_REGRESS=	Yes

EXAMPLESDIR=	${PREFIX}/share/examples/arpwatch

post-extract:
	@chmod u+w ${WRKSRC}/ethercodes.dat
	@cp ${FULLDISTDIR}/${DATAFILE} ${WRKSRC}/ethercodes.dat

pre-configure:
	@perl -pi -e 's,awk -f ,awk -f ${EXAMPLESDIR}/', ${WRKSRC}/massagevendor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/arpwatch ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/arpsnmp ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/arpwatch.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/arpsnmp.8 ${PREFIX}/man/man8
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	@for i in ethercodes.dat *.awk; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${EXAMPLESDIR}; \
	done
	@${INSTALL_DATA} /dev/null ${EXAMPLESDIR}/arp.dat
	@${INSTALL_SCRIPT} ${WRKSRC}/arp2ethers ${EXAMPLESDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/massagevendor ${EXAMPLESDIR}

.include <bsd.port.mk>
