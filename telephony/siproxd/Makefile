# $OpenBSD: Makefile,v 1.6 2010/11/20 19:56:47 espie Exp $

COMMENT=	proxy/masquerading daemon for the SIP protocol

DISTNAME=	siproxd-0.5.13
REVISION=	0
CATEGORIES=	telephony net

HOMEPAGE=	http://siproxd.sourceforge.net/

MAINTAINER=	Mathieu Sauve-Frankel <msf@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=	c osip2 osipparser2 pthread

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=siproxd/}

CONFIGURE_STYLE=gnu

LIB_DEPENDS=    telephony/libosip2

DOCDIR=		${PREFIX}/share/doc/siproxd
EXDIR=		${PREFIX}/share/examples/siproxd

do-install:
	${INSTALL_PROGRAM} ${WRKDIST}/src/siproxd ${PREFIX}/sbin

	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/FAQ ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/KNOWN_BUGS ${DOCDIR}

	${INSTALL_DATA_DIR} ${EXDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/siproxd.conf.example ${EXDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/siproxd_passwd.cfg ${EXDIR}

.include <bsd.port.mk>
